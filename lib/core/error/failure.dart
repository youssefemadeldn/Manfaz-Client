class Failure {
  String failureTitle;
  String errorMessage;

  Failure({required this.errorMessage, required this.failureTitle});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage, required super.failureTitle});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.errorMessage, required super.failureTitle});
}
