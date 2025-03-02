part of 'address_cubit.dart';

@immutable
abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressLoaded extends AddressState {
  final String address;

   AddressLoaded(this.address);
}

class AddressError extends AddressState {
  final String error;

   AddressError(this.error);
}
