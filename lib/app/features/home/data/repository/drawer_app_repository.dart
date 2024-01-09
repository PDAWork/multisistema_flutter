import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/core/error/failure.dart';
import 'package:multisitema_flutter/app/features/home/data/data_source/shared_preferences/sp_local_data_source.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/drawer_app_entity.dart';
import 'package:multisitema_flutter/app/features/home/domain/repository/drawer_app_repository.dart';

// class DrawerAppRepositoryImpl implements DrawerAppRepository {
//   final SPLocalDataSource sp_local;

//   DrawerAppRepositoryImpl({required this.sp_local});

//   @override
//   Future<Either<Failure, DrawerAppEntity>> getData() async {
//     try {
//       final email = sp_local.getEmail();

//     } catch (_) {
//       return left(ServerFailure());
//     }
//   }
// }
