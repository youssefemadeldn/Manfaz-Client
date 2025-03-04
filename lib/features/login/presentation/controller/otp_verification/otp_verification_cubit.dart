import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/cache/shared_pref_utils.dart';
import '../../../../../core/error/failure.dart';
import '../../../domain/use_cases/resend_verification_code_use_case.dart';

part 'otp_verification_state.dart';

@injectable
class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  final ResendVerificationCodeUseCase resendVerificationCodeUseCase;
  Timer? _timer;
  String? _currentPin;
  static const int _initialTime = 120; // seconds
  int _currentTime = _initialTime;
  bool _canResend = false;

  String? get currentPin => _currentPin;

  OtpVerificationCubit(this.resendVerificationCodeUseCase)
      : super(const OtpVerificationInitial()) {
    startTimer();
  }

  void updatePin(String pin) {
    _currentPin = pin;
  }

  void startTimer() {
    _currentTime = _initialTime;
    _canResend = false;
    emit(OtpTimerTick(remainingTime: _currentTime, canResend: _canResend));

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentTime > 0) {
        _currentTime--;
        _canResend = _currentTime == 0;
        emit(OtpTimerTick(remainingTime: _currentTime, canResend: _canResend));
      } else {
        timer.cancel();
        _canResend = true;
        emit(OtpTimerTick(remainingTime: 0, canResend: true));
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
        remainingTime: _currentTime,
        canResend: _canResend,
      ));
      return;
    }

    emit(OtpVerificationLoading(
        remainingTime: _currentTime, canResend: _canResend));
    try {
      final savedOtp = await SharedPrefUtils.getData('verificationCode');

      if (savedOtp == null) {
        emit(OtpVerificationError(
          failure: ServerFailure(
            failureTitle: 'Verification Failed',
            errorMessage:
                'No verification code found. Please request a new code.',
          ),
          remainingTime: _currentTime,
          canResend: _canResend,
        ));
        return;
      }

      if (pinToVerify == savedOtp.toString()) {
        // Clear the verification code after successful verification
        await SharedPrefUtils.removeData('verificationCode');
        emit(const OtpVerificationSuccess());
      } else {
        emit(OtpVerificationError(
          failure: ServerFailure(
            failureTitle: 'Verification Failed',
            errorMessage: 'Invalid verification code. Please try again.',
          ),
          remainingTime: _currentTime,
          canResend: _canResend,
        ));
      }
    } catch (e) {
      emit(OtpVerificationError(
        failure: ServerFailure(
          failureTitle: 'Server Failure',
          errorMessage: 'Failed to verify OTP. Please try again.',
        ),
        remainingTime: _currentTime,
        canResend: _canResend,
      ));
    }
  }

  Future<void> resendOtp() async {
    if (_canResend) {
      emit(OtpVerificationLoading(
          remainingTime: _currentTime, canResend: _canResend));
      try {
        final userId = await SharedPrefUtils.getData('userId');
        if (userId == null) {
          emit(OtpVerificationError(
            failure: ServerFailure(
              failureTitle: 'Error',
              errorMessage: 'User ID not found. Please try again.',
            ),
            remainingTime: _currentTime,
            canResend: _canResend,
          ));
          return;
        }

        final result = await resendVerificationCodeUseCase(userId: userId);

        result.fold(
          (failure) => emit(OtpVerificationError(
            failure: failure,
            remainingTime: _currentTime,
            canResend: _canResend,
          )),
          (resendModel) {
            startTimer();
          },
        );
      } catch (e) {
        emit(OtpVerificationError(
          failure: ServerFailure(
            failureTitle: 'Error',
            errorMessage:
                'Failed to resend verification code. Please try again.',
          ),
          remainingTime: _currentTime,
          canResend: _canResend,
        ));
      }
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
