part of 'otp_verification_cubit.dart';

@immutable
sealed class OtpVerificationState {}

final class OtpVerificationInitial extends OtpVerificationState {}

final class OtpVerificationLoading extends OtpVerificationState {}

final class OtpVerificationSuccess extends OtpVerificationState {}

final class OtpVerificationError extends OtpVerificationState {
  final Failure failure;
  OtpVerificationError({required this.failure});
}

final class OtpTimerTick extends OtpVerificationState {
  final int remainingTime;
  final bool canResend;
  OtpTimerTick({required this.remainingTime, required this.canResend});
}
