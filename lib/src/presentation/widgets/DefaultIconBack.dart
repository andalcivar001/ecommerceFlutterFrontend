import 'package:flutter/material.dart';

class DefaultIconBack extends StatelessWidget {
  double marginLeft = 0;
  double marginTop = 0;
  DefaultIconBack({required this.marginLeft, required this.marginTop});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: marginLeft, top: marginTop),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 35),
      ),
    );
  }
}
