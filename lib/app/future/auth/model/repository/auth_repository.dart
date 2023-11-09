import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/future/auth/data/dto/user_login_dto.dart';
import 'package:multisitema_flutter/app/future/auth/data/dto/user_profile_dto.dart';
import 'package:multisitema_flutter/utils/fauler.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserLoginDTO>> login(String password, String login);


  Future<Either<Failure,UserProfileDTO>> userProfile(String sid);
}
