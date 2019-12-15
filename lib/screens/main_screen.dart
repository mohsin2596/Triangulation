import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triangulation/utils/widget_helper.dart';
import 'package:triangulation/constans/strings.dart';
import 'package:triangulation/widgets/color_picker_btn.dart';

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

  //Default colors
  Color colorOne = Color(0xFF930D22);
  Color colorTwo = Color(0xFFE22E45);
  Color colorThree = Color(0xFF13273A);

  Color pickerColorOne;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final tweakBoxHeight = screenHeight * 0.5;

    var widgetHelper = TriangleWidgetHelper(context: context);
    widgetHelper.setRowsCols(numOfRows, numOfColumns);
    widgetHelper.setColors(colorOne, colorTwo, colorThree);

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
                  height: isEditing ? tweakBoxHeight : 0,
                  color: Color(0XD9000000),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          Strings.tweakBoxTitle,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          ColorPickerBtn(
                            title: 'Color 1',
                            color: colorOne,
                            onColorPicked: changeColorOne,
                          )
                        ],
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

  void changeColorOne(Color color) {
    setState(() => colorOne = color);
  }
}
