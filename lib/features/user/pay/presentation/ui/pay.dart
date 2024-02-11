import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/features/user/pay/presentation/state/cubit/pay_cubit.dart';
import 'package:multisitema_flutter/routes/app_router.dart';
import 'package:multisitema_flutter/routes/router_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Pay extends StatefulWidget {
  const Pay({
    super.key,
    required this.urlPay,
  });
  final String urlPay;

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  TextEditingController value = TextEditingController(text: '0');
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(
          widget.urlPay,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Оплата'),
      ),
      body: BlocConsumer<PayCubit, PayState>(
        listener: (context, state) async {
          if (state is PaySuccess) {
            AppRouter.router.go(Pages.homeUser.screenPath);
          }
        },
        builder: (context, state) {
          return WebViewWidget(
            controller: controller,
          );
        },
      ),
    );
  }
}
