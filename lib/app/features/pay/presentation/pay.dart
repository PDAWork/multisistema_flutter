import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:uni_links/uni_links.dart';
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
                final uuid = Uuid().v4();
                final dio = Dio(
                  BaseOptions(
                    headers: {
                      "Authorization":
                          "Basic NjExMjc0OnRlc3RfODlOZnoxVjlEcFdlM1Rwa1JYSkhOSDFMY245aWlxNGdiQWFNejlraE4zSQ==",
                      "Idempotence-Key": uuid
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
                try {
                  final initialUri = await getInitialUri();
                  final result = await dio.post(
                    'https://api.yookassa.ru/v3/payments',
                    data: {
                      "amount": {"value": value.text, "currency": "RUB"},
                      "capture": true,
                      "confirmation": {
                        "type": "redirect",
                        "return_url": 'myapp://example/'
                      }
                    },
                  );
                  await launchUrl(
                    Uri.parse(result.data['confirmation']['confirmation_url']),
                    webViewConfiguration: WebViewConfiguration(),
                  );
                  int count = 0;
                  final _sub = linkStream.listen(
                    (String? link) async {
                      if (count == 0) {
                        count++;
                        final resultYooKassa = await dio.get(
                            'https://api.yookassa.ru/v3/payments/${result.data['id']}');

                        if (resultYooKassa.data['status'] == 'succeeded') {
                          // context.read<SettingsProvider>().showMessageDialog(
                          //     'Счет был пополнен на ${value.text}', context);
                        }
                      }
                    },
                    onError: (err) {},
                  );
                } on FormatException {}

                print('asdasd');
              },
              child: Text('Пополнить счет'),
            )
          ],
        ),
      ),
    );
  }
}
