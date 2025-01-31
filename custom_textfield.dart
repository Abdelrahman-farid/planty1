import 'package:flutter/material.dart';
import 'package:plantproject/constants.dart';

class CustomTextfield extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final String hintText;

  const CustomTextfield({
    super.key,
    required this.icon,
    required this.obscureText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    // Debugging: Check if blackColor is null
    print("blackColor: ${Constants.blackColor}");

    final Color textColor = Constants.blackColor ?? Colors.black; // Fallback color

    return TextField(
      obscureText: obscureText,
      style: TextStyle(
        color: textColor,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: textColor.withOpacity(0.3)),
        ),
        prefixIcon: Icon(
          icon,
          color: textColor.withOpacity(0.3),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: textColor.withOpacity(0.5)),
      ),
      cursorColor: textColor.withOpacity(0.5),
    );
  }
}
