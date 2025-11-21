import 'package:flutter/material.dart';

class DefaultIconBack extends StatelessWidget {
  double marginLeft = 0;
  double marginTop = 0;
  Color color;
  DefaultIconBack({
    required this.marginLeft,
    required this.marginTop,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: marginLeft, top: marginTop),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios, color: color, size: 35),
      ),
    );
  }
}
