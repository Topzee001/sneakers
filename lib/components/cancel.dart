import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCancel extends StatelessWidget {
  const MyCancel({
    super.key,
    required this.onTap,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Container(
            height: 42,
            width: 79,
            decoration: BoxDecoration(
              color: Color.fromRGBO(249, 249, 249, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Cancel',
                style: GoogleFonts.robotoFlex(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  height: 17.58 / 15,
                  color: Color.fromRGBO(42, 42, 42, 1),
                ),
              ),
            )),
      ),
    );
  }
}
