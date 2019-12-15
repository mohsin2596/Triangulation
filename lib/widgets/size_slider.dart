import 'package:flutter/material.dart';

class SizeSlider extends StatelessWidget {
  final String title;
  final Function onChange;
  final int currValue;

  SizeSlider(
      {@required this.title,
      @required this.currValue,
      @required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.1),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text('$title: $currValue', style: TextStyle(color: Colors.white)),
          Slider(
            value: currValue.toDouble(),
            min: 5,
            max: 50,
            onChanged: onChange,
          ),
        ],
      ),
    );
  }
}
