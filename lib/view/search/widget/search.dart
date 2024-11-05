// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/const_data/app_colors.dart';
import '../../../../../core/const_data/text_style.dart';

class MySearch extends StatelessWidget {
  final TextEditingController? Controller;

  final Function()? onpressed;
  String? UrlPhoto;
  Icon? suffixicon;

  MySearch(
      {required this.Controller,
      required this.onpressed,
      this.UrlPhoto,
      this.suffixicon});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2), // changes the shadow direction
                ),
              ],
            ),
            child: TextFormField(
              controller: Controller,
              onSaved: (String? Value) {},
              validator: (String? Value) {
                if (Value!.isEmpty || Value.isNull) {
                  return "Please Enter Your Data";
                }
                return null;
              },
              decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: suffixicon,
                  ),
                  prefixIcon: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Icon(Icons.search_sharp),
                  ),
                  hintText: 'Search Your Shirt',
                  hintStyle: FontStyles.textStylehinttextsearch,
                  filled: true,
                  fillColor: ColorsApp.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        ),
      ],
    );
  }
}
