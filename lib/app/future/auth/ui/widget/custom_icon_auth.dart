import 'package:flutter/material.dart';

class CustomIconAuth extends StatelessWidget {
  const CustomIconAuth({
    super.key,
    required this.icon,
    required this.iconColor,
  });

  final double _width = 51;
  final double _heigth = 51;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _heigth,
      child: CustomPaint(
        painter: _CustomContainer(),
        child: Icon(
          icon,
          color: iconColor,
          size: _width * 0.6,
        ),
      ),
    );
  }
}

class _CustomContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Color(0xfff3874CF);
    var path = Path()
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * 0.3)
      ..lineTo(size.width * 1.2, size.height * 0.5)
      ..lineTo(size.width, size.height * 0.7)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
