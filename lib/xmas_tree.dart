import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

class XmasBall extends StatefulWidget {

  final Color _startColor;

  XmasBall(this._startColor);


  @override
  _XmasBallState createState() {
    return new _XmasBallState();
  }
}

class _XmasBallState extends State<XmasBall> {

  Color _currentColor;

  final List<Color> _availableColors = [
    Colors.blue, Colors.pink, Colors.purple, Colors.red, Colors.yellow, Colors.orangeAccent, Colors.teal
  ];

  @override void initState() {
    _currentColor = widget._startColor;
    super.initState();
  }

  @override void didChangeDependencies() {
      
      var random = Random();
      Timer.periodic(Duration(seconds: 1), (timer) {

        setState(() {
          _currentColor = _availableColors[random.nextInt(_availableColors.length)];          
        });
        
      });

      super.didChangeDependencies();
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Colors.white, _currentColor
          ],

        ),
        shape: BoxShape.circle,
      ),
    );
  }
}

class XmasTree extends StatelessWidget {
  
  final int _rowsNumber;

  const XmasTree(this._rowsNumber);

  Widget _buildTree() {

    List<Row> ballsRows = List<Row>();

    for (int idxRow = 0; idxRow < _rowsNumber; idxRow++) {
      ballsRows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(idxRow+1, (item) => Padding(
            padding: EdgeInsets.all(8.0),
            child: XmasBall(Colors.pinkAccent),
          )),
        )
      ); 
    }

    return Column( 
      
      children: ballsRows
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTree();
  }
}