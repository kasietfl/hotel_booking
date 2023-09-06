abstract class Failure {}

class ServerFailure extends Failure {
  final String? error;

  ServerFailure({this.error});
}
