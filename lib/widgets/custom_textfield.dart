import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.onChanged,
    required this.label,
    required this.prefixIcon,
    this.keyboardType,
    this.obscureText = false,
    super.key,
  });
  final String label;
  final Icon prefixIcon;
  TextInputType? keyboardType;
  bool obscureText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'fill out this field';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.blue, width: 1),
        ),
        hintText: label,
        hintStyle: GoogleFonts.lato(fontSize: 14, color: Colors.grey[700]),
        prefixIcon: prefixIcon,
        prefixIconColor: Colors.grey[700],
        contentPadding: const EdgeInsets.all(15),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
