part of 'profile_tab_cubit.dart';

sealed class ProfileTabState extends Equatable {
  const ProfileTabState();

  @override
  List<Object> get props => [];
}

final class ProfileTabInitial extends ProfileTabState {}
final class ProfileTabLoading extends ProfileTabState {}
final class ProfileTabSuccess extends ProfileTabState {
  final GetUserProfileModel getUserProfile;
  const ProfileTabSuccess({required this.getUserProfile});
  @override
  List<Object> get props => [getUserProfile];
  
}
final class ProfileTabError extends ProfileTabState {
  final Failure failure;
  const ProfileTabError({required this.failure});
  @override
  List<Object> get props => [failure];
}
