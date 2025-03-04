part of 'otp_verification_cubit.dart';

@immutable
sealed class OtpVerificationState {
  final int? remainingTime;
  final bool canResend;

  const OtpVerificationState({
    this.remainingTime,
    this.canResend = false,
  });
}

final class OtpVerificationInitial extends OtpVerificationState {
  const OtpVerificationInitial() : super(remainingTime: null);
}

final class OtpVerificationLoading extends OtpVerificationState {
  const OtpVerificationLoading({required int remainingTime, required bool canResend}) 
      : super(remainingTime: remainingTime, canResend: canResend);
}

final class OtpVerificationSuccess extends OtpVerificationState {
  const OtpVerificationSuccess() : super(remainingTime: null);
}

final class OtpVerificationError extends OtpVerificationState {
  final Failure failure;
  const OtpVerificationError({
    required this.failure,
    required int remainingTime,
    required bool canResend,
  }) : super(remainingTime: remainingTime, canResend: canResend);
}

final class OtpTimerTick extends OtpVerificationState {
  const OtpTimerTick({required int remainingTime, required bool canResend})
      : super(remainingTime: remainingTime, canResend: canResend);
}
