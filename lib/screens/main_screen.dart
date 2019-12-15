import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triangulation/constans/strings.dart';
import 'package:triangulation/utils/widget_helper.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //Number of rows of triangles to draw on canvas. Used for height calculation as well
  var numOfRows = 10;

  //Number of columns for canvas
  var numOfColumns = 10;

  //Boolean to help us hide and show tweak box
  var isEditing = false;

  @override
  Widget build(BuildContext context) {
    var widgetHelper = TriangleWidgetHelper(context: context);
    widgetHelper.setRowsCols(numOfRows, numOfColumns);

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: isEditing ? Icon(Icons.close) : Icon(Icons.format_paint),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        onPressed: () {
          setState(() {
            isEditing = !isEditing;
          });
        },
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
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: double.infinity,
                  height: isEditing ? 250 : 0,
                  color: Color(0XD9000000),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Tweak It',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
