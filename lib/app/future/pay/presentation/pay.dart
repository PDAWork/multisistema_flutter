import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multisitema_flutter/utils/locator_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  TextEditingController value = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Оплата'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Пополнение счета',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextField(
              controller: value,
              decoration: InputDecoration(hintText: 'Сумма'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () async {
                final dio = Dio(
                  BaseOptions(
                    headers: {
                      "Authorization":
                          "Basic NjExMjc0OnRlc3RfODlOZnoxVjlEcFdlM1Rwa1JYSkhOSDFMY245aWlxNGdiQWFNejlraE4zSQ==",
                      "Idempotence-Key": Uuid().v4()
                    },
                  ),
                )..interceptors.addAll(
                    [
                      PrettyDioLogger(
                        requestHeader: true,
                        requestBody: true,
                        responseBody: true,
                        error: true,
                        compact: true,
                        maxWidth: 90,
                      ),
                    ],
                  );
                final result = await dio.post(
                  'https://api.yookassa.ru/v3/payments',
                  data: {
                    "amount": {"value": value.text, "currency": "RUB"},
                    "capture": true,
                    "confirmation": {
                      "type": "redirect",
                      "return_url": "https://www.example.com/return_url"
                    }
                  },
                );
                // print(result.data['confirmation_url']);
                // await launchUrl(result.data['confirmation_url']);
              },
              child: Text('Пополнить счет'),
            )
          ],
        ),
      ),
    );
  }
}
