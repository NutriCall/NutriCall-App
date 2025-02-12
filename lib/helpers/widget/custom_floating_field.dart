import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class CustomFloatingTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final bool isPassword;

  const CustomFloatingTextField({
    super.key,
    required this.label,
    this.controller,
    this.isPassword = false,
  });

  @override
  _CustomFloatingTextFieldState createState() => _CustomFloatingTextFieldState();
}

class _CustomFloatingTextFieldState extends State<CustomFloatingTextField> {
  bool _isObscured = true; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53,
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _isObscured : false,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: GoogleFonts.poppins(
            color: AppColor.darkGreen,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          floatingLabelStyle: GoogleFonts.poppins(
            color: AppColor.darkGreen,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.darkGreen, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.darkGreen, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          filled: true,
          fillColor: AppColor.darkWhite2,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                    color: AppColor.darkGreen,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null,
        ),
        style: GoogleFonts.poppins(
          color: AppColor.semiBlack,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        cursorColor: AppColor.semiBlack,
      ),
    );
  }
}

