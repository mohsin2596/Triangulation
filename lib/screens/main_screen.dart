import 'package:flutter/material.dart';
import 'package:triangulation/constans/strings.dart';
import 'package:triangulation/utils/draw_triangle.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //Number of rows of triangles to draw on canvas. Used for height calculation as well
  var numOfRows = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: Container(
        child: Column(
          children: columnChildren(context),
        ),
      ),
    );
  }

  List<CustomPaint> getTriangleRow(BuildContext context) {
    List<CustomPaint> triangles = List<CustomPaint>();

    var screenSize = MediaQuery.of(context).size;
    var triangleSize = screenSize.width / 4;

    //Canvas on which triangles will be drawn has roughly 3/5 of screen's height
    var height = ((screenSize.height * 3) / 5) / numOfRows;

    //There will be 4 triangles across the width of our screen for now
    for (int i = 0; i < 4; i++) {
      triangles.add(CustomPaint(
        size: Size(triangleSize, height),
        painter: DrawTriangle(color: Colors.teal, type: TriangleType.normal),
      ));
    }

    return triangles;
  }

  List<Widget> columnChildren(BuildContext context) {
    List<Widget> children = List<Widget>();

    for (int i = 0; i < numOfRows; i++) {
      children.add(Row(children: getTriangleRow(context)));
    }

    children.add(Expanded(
      child: Container(
        color: Colors.orange,
      ),
    ));

    return children;
  }
}
