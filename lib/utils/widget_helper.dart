import 'package:flutter/material.dart';
import 'draw_triangle.dart';

class TriangleWidgetHelper {
  var numOfRows = 0;
  var numOfColumns = 0;
  final BuildContext context;

  TriangleWidgetHelper({this.context});

  void setRowsCols(int rows, int cols) {
    this.numOfRows = rows;
    this.numOfColumns = cols;
  }

  List<CustomPaint> getTriangleRow(BuildContext context) {
    List<CustomPaint> triangles = List<CustomPaint>();

    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width / numOfColumns;

    var height = screenSize.height / numOfRows;

    for (int i = 0; i < numOfColumns; i++) {
      triangles.add(
        CustomPaint(
          size: Size(width, height),
          painter:
              DrawTriangle(color: Color(0xFF930D22), type: TriangleType.normal),
        ),
      );
    }

    return triangles;
  }

  List<Widget> columnChildren(BuildContext context) {
    List<Widget> children = List<Widget>();

    for (int i = 0; i < numOfRows; i++) {
      children.add(Row(children: getTriangleRow(context)));
    }

    return children;
  }

  List<Widget> invertedColumnChildren(BuildContext context) {
    List<Widget> children = List<Widget>();

    for (int i = 0; i < numOfRows; i++) {
      children.add(Row(children: getInvertedTriangleRow(context)));
    }

    return children;
  }

  List<CustomPaint> getInvertedTriangleRow(BuildContext context) {
    List<CustomPaint> triangles = List<CustomPaint>();

    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width / numOfColumns;

    var height = screenSize.height / numOfRows;

    //Left inverted triangle
    triangles.add(
      CustomPaint(
        size: Size(width / 2, height),
        painter: DrawTriangle(
            color: Color(0xFFE22E45), type: TriangleType.leftCorner),
      ),
    );

    for (int i = 0; i < numOfColumns - 1; i++) {
      triangles.add(
        CustomPaint(
          size: Size(width, height),
          painter: DrawTriangle(
              color: Color(0xFF13273A), type: TriangleType.inverted),
        ),
      );
    }

    //Right inverted triangle
    triangles.add(
      CustomPaint(
        size: Size(width / 2, height),
        painter: DrawTriangle(
            color: Color(0xFFE22E45), type: TriangleType.rightCorner),
      ),
    );

    return triangles;
  }

  Widget tweakContainer() {
    return Container(
      width: double.infinity,
      color: Color(0X1A000000),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Tweak It',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
