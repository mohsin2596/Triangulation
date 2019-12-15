import 'package:flutter/material.dart';
import 'draw_triangle.dart';

class TriangleWidgetHelper {
  var numOfRows = 0;
  var numOfColumns = 0;

  //Default Colors for pattern
  Color colorOne;
  Color colorTwo;
  Color colorThree;

  final BuildContext context;

  TriangleWidgetHelper({this.context});

  void setRowsCols(int rows, int cols) {
    this.numOfRows = rows;
    this.numOfColumns = cols;
  }

  void setColors(Color colorOne, Color colorTwo, Color colorThree) {
    this.colorOne = colorOne;
    this.colorTwo = colorTwo;
    this.colorThree = colorThree;
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
          painter: DrawTriangle(color: colorOne, type: TriangleType.normal),
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
        painter: DrawTriangle(color: colorTwo, type: TriangleType.leftCorner),
      ),
    );

    for (int i = 0; i < numOfColumns - 1; i++) {
      triangles.add(
        CustomPaint(
          size: Size(width, height),
          painter: DrawTriangle(color: colorThree, type: TriangleType.inverted),
        ),
      );
    }

    //Right inverted triangle
    triangles.add(
      CustomPaint(
        size: Size(width / 2, height),
        painter: DrawTriangle(color: colorTwo, type: TriangleType.rightCorner),
      ),
    );

    return triangles;
  }
}
