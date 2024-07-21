import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProceed extends StatelessWidget {
  const MyProceed({
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
          width: 88,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 114, 198, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'Proceed',
              style: GoogleFonts.robotoFlex(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                height: 17.58 / 15,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
