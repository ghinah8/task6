// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:task6/core/const_data/app_colors.dart';
import 'package:task6/core/const_data/text_style.dart';
import 'package:task6/core/services/media_query_service.dart';

class CustomTextfield extends StatelessWidget {
  final String hinttext;
  final bool? obscure;
  var suffixicon;
  var controller;
  var onchange;
  CustomTextfield(
      {required this.hinttext,
      this.obscure,
      this.suffixicon,
      this.controller,
      this.onchange});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335 * Responsive.responsiveWidth,
      height: 48 * Responsive.responsiveHeight,
      decoration: BoxDecoration(
          color: ColorsApp.textfieldcolor,
          borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.only(left: 13, top: 14, bottom: 14),
        child: TextField(
          onChanged: onchange,
          controller: controller,
          obscureText: obscure!,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hinttext,
            hintStyle: FontStyles.textStylehinttext,
            suffixIcon: suffixicon,
          ),
        ),
      ),
    );
  }
}
