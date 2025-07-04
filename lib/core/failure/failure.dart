abstract class Failure {
  Failure({required this.message});

  final String message;
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}
