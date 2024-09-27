import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBottomContainer extends StatelessWidget {
  const MyBottomContainer({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
        height: 42,
        width: 350,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromRGBO(0, 114, 198, 1).withOpacity(0.2),
        ),
        // width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class MyBottomContainer1 extends StatelessWidget {
  const MyBottomContainer1(
      {super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
          height: 42,
          width: 350,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(0, 114, 198, 1),
          ),
          // width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
