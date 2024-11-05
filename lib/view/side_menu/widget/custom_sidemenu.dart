import 'package:flutter/material.dart';
import 'package:task6/core/const_data/app_colors.dart';
import 'package:task6/core/const_data/text_style.dart';

class CustomSidemenu extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onpressed;
  final double padding;

  const CustomSidemenu(
      {required this.name,
      required this.icon,
      required this.onpressed,
      required this.padding});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: ColorsApp.white,
        ),
        SizedBox(
          width: 25,
        ),
        TextButton(
            onPressed: onpressed,
            child: Text(
              name,
              style: FontStyles.textStylesidemenu,
            )),
        Padding(
          padding: EdgeInsets.only(left: padding),
          child: Icon(
            size: 15,
            Icons.arrow_forward_ios,
            color: ColorsApp.textfieldcolor,
          ),
        ),
        SizedBox(
          height: 60,
        )
      ],
    );
  }
}
