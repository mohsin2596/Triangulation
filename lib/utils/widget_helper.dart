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

    //Canvas on which triangles will be drawn has roughly 3/5 of screen's height
    var height = ((screenSize.height * 3) / 5) / numOfRows;

    for (int i = 0; i < numOfColumns; i++) {
      triangles.add(
        CustomPaint(
          size: Size(width, height),
          painter: DrawTriangle(
              color: Colors.transparent, type: TriangleType.normal),
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

    children.add(Expanded(
      child: tweakContainer(),
    ));

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

    //Canvas on which triangles will be drawn has roughly 3/5 of screen's height
    var height = ((screenSize.height * 3) / 5) / numOfRows;

    //Left inverted triangle
    triangles.add(
      CustomPaint(
        size: Size(width / 2, height),
        painter: DrawTriangle(
            color: Colors.transparent, type: TriangleType.leftCorner),
      ),
    );

    for (int i = 0; i < numOfColumns - 1; i++) {
      triangles.add(
        CustomPaint(
          size: Size(width, height),
          painter: DrawTriangle(
              color: Colors.transparent, type: TriangleType.inverted),
        ),
      );
    }

    //Right inverted triangle
    triangles.add(
      CustomPaint(
        size: Size(width / 2, height),
        painter: DrawTriangle(
            color: Colors.transparent, type: TriangleType.rightCorner),
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
