import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;

  const MyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 12,
      alignment: Alignment.center,
      decoration: const BoxDecoration(),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.robotoFlex(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          height: 1.172,
          color: const Color.fromRGBO(42, 42, 42, 1), // Text color (change as needed)
        ),
      ),
    );
  }
}
