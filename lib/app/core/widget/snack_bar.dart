import 'package:flutter/material.dart';

void showMessageDialog(String title, BuildContext context) {
  final query = MediaQuery.of(context);
  final width = query.size.width * 0.80;
  // final height = query.size.height  < 20
  //     ? 20.0
  //     : MediaQuery.of(context).size.height * 0.023;
  final height = query.size.height * 0.023;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.startToEnd,
      backgroundColor: Colors.white60.withOpacity(.90),
      content: SizedBox(
        height: height,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                // maxLines: 2,
                // softWrap: true,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: height,
              height: height,
              child: Icon(
                Icons.check,
                size: height,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      margin: const EdgeInsets.all(12),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
