import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/resources/app_colors.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({
    super.key,
    required this.text,
    this.color,
    this.onPressed,
    this.height,
    this.raduis,
  });

  final String text;
  final Color? color;
  final VoidCallback? onPressed;
  final double? height;
  final double? raduis;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: MaterialButton(
        height: height,
        minWidth: double.infinity,
        color: color ?? AppColors.switchColor,
        onPressed: onPressed ?? () {},
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
      ),
    );
  }
}
