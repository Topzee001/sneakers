import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SelectableText(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}

class MyText1 extends StatelessWidget {
  const MyText1({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14,
      width: 350,
      child: Text(
        text,
        style: GoogleFonts.robotoFlex(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 14.06 / 12,
          color: Color.fromRGBO(41, 41, 41, 1),
        ),
      ),
    );
  }
}
