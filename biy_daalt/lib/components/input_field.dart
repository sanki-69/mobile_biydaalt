import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String? suffixText;
  final IconData? suffixIcon;
  final bool obscureText;

  const InputField({
    required this.label,
    this.suffixText,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffixText,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        border: const UnderlineInputBorder(), // ✅ underline style only
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }
}
