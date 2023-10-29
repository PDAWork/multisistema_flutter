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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(path),
          const SizedBox(height: 25),
          Text(
            header,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 25),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
