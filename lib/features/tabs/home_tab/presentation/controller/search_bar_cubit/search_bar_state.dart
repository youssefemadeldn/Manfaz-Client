part of 'search_bar_cubit.dart';

@immutable
abstract class SearchBarState {}

class SearchBarInitial extends SearchBarState {}

class SearchBarLoading extends SearchBarState {}

class SearchBarLoaded extends SearchBarState {
  final String address;

  SearchBarLoaded(this.address);
}

class SearchBarLocationsLoaded extends SearchBarState {
  final List<Data> locations;

  SearchBarLocationsLoaded(this.locations);
}

class SearchBarError extends SearchBarState {
  final String error;

  SearchBarError(this.error);
}
