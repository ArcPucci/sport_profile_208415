import 'package:flutter/material.dart';

class ProfileImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width * 0.5, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.133);
    path.cubicTo(
      size.width * 0.93,
      size.height * 0.125,
      size.width * 0.872,
      size.height * 0.097,
      size.width * 0.774,
      size.height * 0.049,
    );
    path.cubicTo(
      size.width * 0.768,
      size.height * 0.046,
      size.width * 0.762,
      size.height * 0.043,
      size.width * 0.757,
      size.height * 0.04,
    );
    path.cubicTo(
      size.width * 0.725,
      size.height * 0.027,
      size.width * 0.65,
      size.height * 0.008,
      size.width * 0.632,
      size.height * 0.011,
    );
    path.cubicTo(
      size.width * 0.624,
      size.height * 0.024,
      size.width * 0.593,
      size.height * 0.045,
      size.width * 0.54,
      size.height * 0.025,
    );
    path.lineTo(size.width * 0.5, size.height * 0.003);
    path.close();

    path.moveTo(0, size.height);
    path.lineTo(size.width * 0.003, size.height * 0.133);
    path.cubicTo(
      size.width * 0.073,
      size.height * 0.127,
      size.width * 0.131,
      size.height * 0.099,
      size.width * 0.229,
      size.height * 0.051,
    );
    path.cubicTo(
      size.width * 0.235,
      size.height * 0.048,
      size.width * 0.241,
      size.height * 0.045,
      size.width * 0.246,
      size.height * 0.042,
    );
    path.cubicTo(
      size.width * 0.278,
      size.height * 0.029,
      size.width * 0.353,
      size.height * 0.01,
      size.width * 0.371,
      size.height * 0.013,
    );
    path.cubicTo(
      size.width * 0.379,
      size.height * 0.026,
      size.width * 0.41,
      size.height * 0.047,
      size.width * 0.463,
      size.height * 0.027,
    );
    path.lineTo(size.width * 0.5, size.height * 0.005);
    path.lineTo(size.width * 0.5, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
