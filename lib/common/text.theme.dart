import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(

      //appbar
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFFFCE00),
      ),

      //textbuttontheme
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
        ),
      ),

      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFC4C4C4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x50333333),
          ),
        ),
      ),
      dividerColor: Colors.transparent,
      unselectedWidgetColor: const Color(0x50333333),
      shadowColor: const Color(0xFFe6e6e6).withOpacity(0.5),
      visualDensity: VisualDensity.adaptivePlatformDensity,

      //text theme/style
      fontFamily: 'Poppins',
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          color: const Color(0xFF111111),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.poppins(
          color: const Color(0xFF111111),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: GoogleFonts.poppins(
          color: const Color(0xFF111111),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: GoogleFonts.poppins(
          color: const Color(0xFF111111),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: GoogleFonts.poppins(
          color: const Color(0xFF111111),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: GoogleFonts.poppins(
          color: const Color(0x50333333),
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: GoogleFonts.poppins(
          color: const Color(0xFF111111),
          fontSize: 9,
          fontWeight: FontWeight.bold,
        ),

        //splashscreen text
         bodySmall:GoogleFonts.roboto(
             color: const Color(0xFF111111),
            fontWeight:  FontWeight.w700,
            fontSize:  20,
            letterSpacing: 0.5,
      ),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
          .copyWith(background: Colors.white),
    );
  }
}
