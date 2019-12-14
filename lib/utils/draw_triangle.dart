import 'package:flutter/material.dart';

//Variations of triangle supported by Custom Painter
enum TriangleType {
  leftCorner, //Covers half cuts on left part of the screen
  rightCorner, //Covers half cuts on right parts of the screen
  normal, //Normal triangle
  inverted //Inverted from normal look
}

class DrawTriangle extends CustomPainter {
  Paint _paint;

  final Color color;
  final TriangleType type;

  DrawTriangle(
      {this.color = Colors.transparent, this.type = TriangleType.normal}) {
    _paint = Paint();
    _paint.color = color;
    _paint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    switch (type) {
      case TriangleType.normal:
        path.moveTo(0, size.height);
        path.lineTo(size.width / 2, 0);
        path.lineTo(size.width, size.height);
        path.lineTo(0, size.height);

        break;

      case TriangleType.leftCorner:
        path.lineTo(0, size.height);
        path.lineTo(size.width, 0);
        path.lineTo(0, 0);

        break;

      case TriangleType.rightCorner:
        path.lineTo(size.width, size.height);
        path.lineTo(size.width, 0);
        path.lineTo(0, 0);

        break;

      case TriangleType.inverted:
        path.lineTo(size.width / 2, size.height);
        path.lineTo(size.width, 0);
        path.lineTo(0, 0);

        break;

      default:
        break;
    }

    //right angle triangle
//    path.lineTo(size.width, size.height / 2);
//    path.lineTo(0, size.height);
//    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
