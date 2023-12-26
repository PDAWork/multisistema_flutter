import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({
    super.key,
    required this.title,
    required this.header,
    required this.path,
  });

  final String title;
  final String header;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       Image.asset(
              path,
              height: 370,
            ),
          const SizedBox(height: 20),
          Text(
            header,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
