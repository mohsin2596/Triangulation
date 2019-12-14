import 'package:flutter/material.dart';
import 'package:triangulation/constans/strings.dart';
import 'package:triangulation/utils/widget_helper.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //Number of rows of triangles to draw on canvas. Used for height calculation as well
  var numOfRows = 5;

  //Number of columns for canvas
  var numOfColumns = 5;

  @override
  Widget build(BuildContext context) {
    var widgetHelper = TriangleWidgetHelper(context: context);
    widgetHelper.setRowsCols(numOfRows, numOfColumns);

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: Container(
        //Triangles will be stacked onto one another to fill screen
        child: Stack(
          children: <Widget>[
            Column(
              children: widgetHelper.columnChildren(context),
            ),
            Column(
              children: widgetHelper.invertedColumnChildren(context),
            )
          ],
        ),
      ),
    );
  }
}
