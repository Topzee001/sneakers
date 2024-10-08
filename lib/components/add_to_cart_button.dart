import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneakers/constants/svg_icons.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.onAddToCart});

  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onAddToCart,
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            height: 42,
            width: 141,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 114, 198, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SvgPicture.string(SvgIcons.cartIcon),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    'Add to Cart',
                    style: GoogleFonts.robotoFlex(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
