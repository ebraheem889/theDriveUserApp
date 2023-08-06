// ignore_for_file: non_constant_identifier_names

import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.7955617);
    path_0.cubicTo(size.width * 1, size.height * 0.7, size.width * 0.9, size.height * 0.72, size.width * 0.9,
        size.height * 0.7182769);
    path_0.lineTo(size.width * 0.2131903, size.height * 0.7182769);
    path_0.cubicTo(
        size.width * 0.09544840, size.height * 0.7182883, 0, size.height * 0.5831847, 0, size.height * 0.4164859);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.01600000, size.height * 0.03100000),
        Offset(size.width * 0.01438000, size.height * 0.01485000),
        [const Color(0xff45a080).withOpacity(1), const Color(0xff00b8ad).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_0, paint_0_fill);

    // Path path_1 = Path();
    // // path_1.moveTo(size.width * -7.444139, size.height * -0.6281814);
    // // path_1.lineTo(size.width * -7.444139, size.height * -0.6281814);
    // path_1.arcToPoint(Offset(size.width * -7.461556, size.height * -0.6669430),
    //     radius:
    //     Radius.elliptical(size.width * 0.05682691, size.height * 0.1326901),
    //     rotation: 0,
    //     largeArc: false,
    //     clockwise: false);
    // path_1.cubicTo(
    //     size.width * -7.473108,
    //     size.height * -0.6846316,
    //     size.width * -7.493726,
    //     size.height * -0.7057160,
    //     size.width * -7.526360,
    //     size.height * -0.7057160);
    // path_1.lineTo(size.width * -8.143032, size.height * -0.7057160);
    // path_1.arcToPoint(Offset(size.width * -8.225960, size.height * -0.7295147),
    //     radius:
    //     Radius.elliptical(size.width * 0.3329556, size.height * 0.7774472),
    //     rotation: 0,
    //     largeArc: false,
    //     clockwise: true);
    // path_1.arcToPoint(Offset(size.width * -8.293690, size.height * -0.7944146),
    //     radius:
    //     Radius.elliptical(size.width * 0.2499052, size.height * 0.5835255),
    //     rotation: 0,
    //     largeArc: false,
    //     clockwise: true);
    // path_1.arcToPoint(Offset(size.width * -8.319711, size.height * -0.8392352),
    //     radius:
    //     Radius.elliptical(size.width * 0.1742746, size.height * 0.4069289),
    //     rotation: 0,
    //     largeArc: false,
    //     clockwise: true);
    // path_1.arcToPoint(Offset(size.width * -8.339356, size.height * -0.8906770),
    //     radius:
    //     Radius.elliptical(size.width * 0.1289239, size.height * 0.3010358),
    //     rotation: 0,
    //     largeArc: false,
    //     clockwise: true);
    // path_1.arcToPoint(Offset(size.width * -8.356112, size.height * -1.008563),
    //     radius:
    //     Radius.elliptical(size.width * 0.08753490, size.height * 0.2043929),
    //     rotation: 0,
    //     largeArc: false,
    //     clockwise: true);
    // path_1.lineTo(size.width * -8.356112, size.height * -1.027501);
    // path_1.cubicTo(
    //     size.width * -8.355757,
    //     size.height * -0.9473601,
    //     size.width * -8.333595,
    //     size.height * -0.8720060,
    //     size.width * -8.293704,
    //     size.height * -0.8153059);
    // path_1.cubicTo(
    //     size.width * -8.253458,
    //     size.height * -0.7581061,
    //     size.width * -8.199951,
    //     size.height * -0.7266073,
    //     size.width * -8.143036,
    //     size.height * -0.7266073);
    // path_1.lineTo(size.width * -7.526365, size.height * -0.7266073);
    // path_1.arcToPoint(Offset(size.width * -7.486865, size.height * -0.7144893),
    //     radius:
    //     Radius.elliptical(size.width * 0.1414192, size.height * 0.3302120),
    //     rotation: 0,
    //     largeArc: false,
    //     clockwise: true);
    // path_1.arcToPoint(Offset(size.width * -7.461573, size.height * -0.6878343),
    //     radius:
    //     Radius.elliptical(size.width * 0.09409868, size.height * 0.2197193),
    //     rotation: 0,
    //     largeArc: false,
    //     clockwise: true);
    // path_1.arcToPoint(Offset(size.width * -7.444139, size.height * -0.6490557),
    //     radius:
    //     Radius.elliptical(size.width * 0.05739355, size.height * 0.1340132),
    //     rotation: 0,
    //     largeArc: false,
    //     clockwise: true);
    // path_1.lineTo(size.width * -7.444139, size.height * -0.6281700);
    // path_1.close();

    // Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    // paint_1_fill.color = Color(0xff4e9fcf).withOpacity(1.0);
    // canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
