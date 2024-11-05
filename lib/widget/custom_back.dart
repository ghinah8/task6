import 'package:flutter/material.dart';
import 'package:task6/core/const_data/app_colors.dart';

class CustomBack extends StatelessWidget {
  final Color color;
  final VoidCallback onpressed;
  CustomBack({required this.onpressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        minRadius: 1,
        maxRadius: 6,
        backgroundColor: color,
        child: IconButton(
          color: ColorsApp.signinText1Color,
          iconSize: 15,
          onPressed: onpressed,
          icon: Icon(Icons.arrow_back_ios),
        ));
  }
}
