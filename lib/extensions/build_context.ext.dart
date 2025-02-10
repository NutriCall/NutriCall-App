import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension BuildContextExt on BuildContext {
  double get deviceHeight => MediaQuery.of(this).size.height;

  double get deviceWidth => MediaQuery.of(this).size.width;

  void closeSnackbar() {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
  }

  void showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.only(bottom: deviceHeight - 150, left: 20, right: 20),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  void showErrorSnackbar(String message) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        margin: EdgeInsets.only(bottom: message.length > 1 ? deviceHeight - 170 : deviceHeight - 150, left: 20, right: 20),
        backgroundColor: Colors.red,
      ),
    );
  }
}
