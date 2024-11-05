import 'package:flutter/material.dart';
import 'package:task6/core/const_data/app_colors.dart';
import 'package:task6/core/const_data/text_style.dart';
import 'package:task6/widget/custom_back.dart';
import 'package:task6/view/search/widget/search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.textfieldcolor,
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Cancel',
                style: FontStyles.textStylecancel,
              ))
        ],
        title: const Center(
          child: Text(
            'Search',
            style: FontStyles.textStylesearchtitle,
          ),
        ),
        backgroundColor: ColorsApp.textfieldcolor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 8),
          child: CustomBack(onpressed: () {}, color: ColorsApp.textfieldcolor),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: MySearch(
              suffixicon: const Icon(Icons.mic_none_outlined),
              Controller: null,
              onpressed: () {},
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'shirt',
                style: FontStyles.textStylesearchshirt,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.access_time,
                    color: ColorsApp.signinText2Color,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'New t-Shirt',
                    style: FontStyles.textStylesearchshirtname,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
