import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task6/core/const_data/app_colors.dart';
import 'package:task6/core/const_data/text_style.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final String imageprice;
  final String imagename;
  final VoidCallback onpressedinc;
  final VoidCallback onpresseddec;
  final int count;
  final VoidCallback onDelete; // Delete callback

  const CustomCard({
    super.key,
    required this.image,
    required this.imageprice,
    required this.imagename,
    required this.onpressedinc,
    required this.count,
    required this.onpresseddec,
    required this.onDelete, // Add delete callback
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const BehindMotion(),
          extentRatio: 0.2,
          children: [
            Container(
              height: 117,
              width: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorsApp.signinbutton,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.add, color: ColorsApp.white),
                    onPressed: onpressedinc, // Increment count for this product
                  ),
                  Text(
                    '$count', // Show specific product count
                    style: FontStyles.textStyleitemcountity,
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove, color: ColorsApp.white),
                    onPressed: onpresseddec, // Decrement count for this product
                  )
                ],
              ),
            ),
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const BehindMotion(),
          children: [
            // Sliding delete button
            GestureDetector(
              onTap: onDelete, // Call delete callback when swiped
              child: Container(
                height: 117,
                width: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorsApp.deletebutton,
                ),
                child: const Icon(Icons.delete, color: ColorsApp.white),
              ),
            ),
          ],
        ),
        child: Card(
          color: ColorsApp.white,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 105,
                  width: 100,
                  decoration: BoxDecoration(
                    color: ColorsApp.textfieldcolor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Image.asset(
                    'asset/images/$image',
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      imagename,
                      style: FontStyles.textStyletshirtname,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$$imageprice',
                      style: FontStyles.textStyletshirtprice,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
