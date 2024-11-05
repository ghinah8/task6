import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onpressed;
  final Color? BackgroundColor;
  final double? MyWidth;
  final double? MyHeight;
  final TextStyle style;
  final String? imagepath;

  CustomButton(
      {required this.text,
      required this.onpressed,
      required this.BackgroundColor,
      required this.MyHeight,
      required this.MyWidth,
      required this.style,
      this.imagepath});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagepath != null) // Display the logo if iconPath is provided
            Padding(
              padding: const EdgeInsets.only(
                  right: 10.0), // Add some space between logo and text
              child: Image.asset(
                imagepath!,
                height: 24, // Adjust the size of the logo
                width: 24,
              ),
            ),
          Text(
            text,
            style: style,
          ),
        ],
      ),
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        backgroundColor: WidgetStateProperty.all(BackgroundColor),
        fixedSize: WidgetStateProperty.all(Size(MyWidth!, MyHeight!)),
      ),
    );
  }
}
