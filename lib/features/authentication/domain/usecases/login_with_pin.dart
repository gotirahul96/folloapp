import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginWithPin implements UseCase<User, String> {
  final AuthRepository repository;
  LoginWithPin(this.repository);

  @override
  Future<Either<Failure, User>> call(String pin) {
    return repository.authenticateWithPin(pin);
  }
}
