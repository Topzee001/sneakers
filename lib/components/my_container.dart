import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyContainerButton extends StatelessWidget {
  const MyContainerButton({super.key, required this.onTap, required this.text});
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 350,
          height: 42,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 114, 198, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.robotoFlex(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
