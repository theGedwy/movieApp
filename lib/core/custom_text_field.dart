import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.isObscured = false,
    this.onTap,
    this.suffixIcon = false,
    this.controller,
    this.onChanged,
  });

  final String hint;
  final IconData icon;
  final bool isObscured;
  final VoidCallback? onTap;
  final bool suffixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        obscureText: isObscured,
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.white),
          hintText: hint,
          suffixIcon:
              suffixIcon
                  ? isObscured
                      ? IconButton(
                        icon: Icon(Icons.visibility, color: Colors.white),
                        onPressed: onTap,
                      )
                      : IconButton(
                        icon: Icon(Icons.visibility, color: Colors.blue),
                        onPressed: onTap,
                      )
                  : null,
          hintStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
