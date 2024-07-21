import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCheckoutButton extends StatelessWidget {
  const MyCheckoutButton({super.key, required this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 97,
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 114, 198, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          'Checkout',
          style: GoogleFonts.robotoFlex(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            height: 17.54 / 15,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        )),
      ),
    );
  }
}
// 