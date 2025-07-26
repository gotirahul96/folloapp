import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> authenticateWithPin(String pin);
  Future<Either<Failure, User>> authenticateBiometric();
  Future<void> logout();
}
