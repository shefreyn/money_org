import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {
  static TextStyle header(bool isDark,
      {FontWeight? fontWeight, Color? customColor}) {
    return GoogleFonts.abel(
      fontSize: 28,
      color: isDark
          ? Colors.white.withOpacity(0.6)
          : Colors.black.withOpacity(0.6),
      fontWeight: fontWeight,
    );
  }
}
