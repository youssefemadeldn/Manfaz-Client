part of 'edit_profile_bottom_sheet_cubit.dart';

abstract class EditProfileBottomSheetState extends Equatable {
  const EditProfileBottomSheetState();

  @override
  List<Object?> get props => [];
}

class EditProfileBottomSheetInitial extends EditProfileBottomSheetState {}

class EditProfileBottomSheetLoading extends EditProfileBottomSheetState {}

class EditProfileBottomSheetSuccess extends EditProfileBottomSheetState {
  final String message;

  const EditProfileBottomSheetSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class EditProfileBottomSheetError extends EditProfileBottomSheetState {
  final String message;

  const EditProfileBottomSheetError({required this.message});

  @override
  List<Object?> get props => [message];
}

class EditProfileBottomSheetForm extends EditProfileBottomSheetState {
  final String name;
  final String? password;
  final String? imageUrl;
  final bool isPasswordVisible;
  final bool isLoading;

  const EditProfileBottomSheetForm({
    required this.name,
    this.password,
    this.imageUrl,
    this.isPasswordVisible = false,
    this.isLoading = false,
  });

  EditProfileBottomSheetForm copyWith({
    String? name,
    String? password,
    String? imageUrl,
    bool? isPasswordVisible,
    bool? isLoading,
  }) {
    return EditProfileBottomSheetForm(
      name: name ?? this.name,
      password: password ?? this.password,
      imageUrl: imageUrl ?? this.imageUrl,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [name, password, imageUrl, isPasswordVisible, isLoading];
}
