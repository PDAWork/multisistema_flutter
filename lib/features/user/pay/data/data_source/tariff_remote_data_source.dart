import 'package:dio/dio.dart';
import 'package:multisitema_flutter/core/error/exeption.dart';
import 'package:multisitema_flutter/core/network/api_entrypoints.dart';
import 'package:multisitema_flutter/features/user/pay/data/model/pay_dto.dart';
import 'package:multisitema_flutter/features/user/pay/data/model/pay_model.dart';
import 'package:multisitema_flutter/features/user/pay/data/model/tariff_model.dart';
import 'package:multisitema_flutter/features/user/pay/data/model/tariff_object_model.dart';

abstract interface class TariffRemoteDataSource {
  Future<List<TariffModel>> getAllTariff();
  Future<PayModel> pay(PayDto dto);
  Future<List<TariffObjectModel>> getAllTariffObject();
}

final class TariffRemoteDataSourceImpl implements TariffRemoteDataSource {
  final Dio dio;

  TariffRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<TariffModel>> getAllTariff() async {
    try {
      final result = await dio.get(ApiEndpoints.tariff);
      return (result.data as List).map((e) => TariffModel.fromJson(e)).toList();
    } on DioException catch (_) {
      throw ServerException();
    }
  }

  @override
  Future<PayModel> pay(PayDto dto) async {
    try {
      final result = await dio.post(ApiEndpoints.pay, data: dto.toJson());
      return PayModel.fromJson(result.data);
    } on DioException catch (_) {
      throw ServerException();
    }
  }

  @override
  Future<List<TariffObjectModel>> getAllTariffObject() async {
    try {
      final result = await dio.get(ApiEndpoints.allTariffObject);
      return (result.data as List)
          .map((data) => TariffObjectModel.fromJson(data))
          .toList();
    } on DioException catch (_) {
      throw ServerException();
    }
  }
}
