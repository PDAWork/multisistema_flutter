import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/core/network/api_entrypoints.dart';
import 'package:socket_io_client/socket_io_client.dart';
part 'pay_state.dart';

class PayCubit extends Cubit<PayState> {
  PayCubit() : super(PayInital());

  final socket = io(ApiEndpoints.socket, <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });

  Future<void> init(String orderId) async {
    final socket = io(ApiEndpoints.socket, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.on(orderId, (value) async {
      print(value);
      if ((value as String) == 'succeeded') {
        await Future.delayed(Duration(milliseconds: 400));
        emit(PaySuccess());
        socket.disconnect();
      }
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
