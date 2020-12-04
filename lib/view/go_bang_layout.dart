import 'dart:math';

import 'package:flutter/material.dart';

class GoBangLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GoBangLayoutState();
  }
}

class GoBangLayoutState extends State<GoBangLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GoGang demo"),
        ),
        body: Center(
          child: Container(
              color: Colors.yellow,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CustomPaint(
                  size: Size(300, 300),
                  painter: GoBangCheckerboardView(),
                  child: CustomPaint(
                    size: Size(300, 300),
                    painter: GoBangPieceView(),
                  ),
                ),
              )),
        ));
  }
}

class GoBangCheckerboardView extends CustomPainter {
  Paint _paint;
  Paint _strokePaint;

  GoBangCheckerboardView() {
    _paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb175);

    _strokePaint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..color = Colors.black87
      ..strokeWidth = 1.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, _paint);

    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    for (int i = 0; i <= 15; i++) {
      double dy = eHeight * i;

      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), _strokePaint);
    }
    for (int j = 0; j <= 15; j++) {
      double dx = eWidth * j;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), _strokePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class GoBangPieceView extends CustomPainter {
  Paint whitePaint;
  Paint blackPaint;

  GoBangPieceView() {
    whitePaint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    blackPaint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Colors.black;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    //first
    canvas.drawCircle(
        Offset(0, 0), min(eHeight / 2, eWidth / 2) - 2, whitePaint);

    canvas.drawCircle(
        Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
        min(eHeight / 2, eWidth / 2) - 2,
        blackPaint);

    canvas.drawCircle(
        Offset(size.width / 2 + eWidth / 2, size.height / 2 + eHeight / 2),
        min(eHeight / 2, eWidth / 2) - 2,
        whitePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
