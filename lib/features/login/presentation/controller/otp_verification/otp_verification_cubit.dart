import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/cache/shared_pref_utils.dart';
import '../../../../../core/error/failure.dart';

part 'otp_verification_state.dart';

@injectable
class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  Timer? _timer;
  String? _currentPin;
  static const int _initialTime = 180; // 3 minutes in seconds
  
  String? get currentPin => _currentPin;
  
  OtpVerificationCubit() : super(OtpVerificationInitial()) {
    startTimer();
  }

  void updatePin(String pin) {
    _currentPin = pin;
  }

  void startTimer() {
    emit(OtpTimerTick(remainingTime: _initialTime, canResend: false));
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final currentState = state;
      if (currentState is OtpTimerTick) {
        if (currentState.remainingTime > 0) {
          emit(OtpTimerTick(
            remainingTime: currentState.remainingTime - 1,
            canResend: false,
          ));
        } else {
          timer.cancel();
          emit(OtpTimerTick(remainingTime: 0, canResend: true));
        }
      }
    });
  }

  Future<void> verifyOtp([String? pin]) async {
    final pinToVerify = pin ?? _currentPin;
    if (pinToVerify == null || pinToVerify.length != 4) {
      emit(OtpVerificationError(
        failure: ServerFailure(
          failureTitle: 'Validation Error',
          errorMessage: 'Please enter a valid 4-digit code.',
        ),
      ));
      return;
    }

    emit(OtpVerificationLoading());
    try {
      final savedOtp = await SharedPrefUtils.getData( 'verificationCode');
      
      if (savedOtp == null) {
        emit(OtpVerificationError(
          failure: ServerFailure(
            failureTitle: 'Verification Failed',
            errorMessage: 'No verification code found. Please request a new code.',
          ),
        ));
        return;
      }

      if (pinToVerify == savedOtp.toString()) {
        // Clear the verification code after successful verification
        await SharedPrefUtils.removeData( 'verificationCode');
        emit(OtpVerificationSuccess());
      } else {
        emit(OtpVerificationError(
          failure: ServerFailure(
            failureTitle: 'Verification Failed',
            errorMessage: 'Invalid verification code. Please try again.',
          ),
        ));
      }
    } catch (e) {
      emit(OtpVerificationError(
        failure: ServerFailure(
          failureTitle: 'Server Failure',
          errorMessage: 'Failed to verify OTP. Please try again.',
        ),
      ));
    }
  }

  void resendOtp() {
    final currentState = state;
    if (currentState is OtpTimerTick && currentState.canResend) {
      startTimer();
      // TODO: Implement resend OTP logic here - you'll need to call the register API again
    }
  }

  String formatTime(int timeInSeconds) {
    int minutes = timeInSeconds ~/ 60;
    int seconds = timeInSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
