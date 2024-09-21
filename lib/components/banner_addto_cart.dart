import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sneakers/constants/svg_icons.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../model/product.dart';
import '../provider/cart_provider.dart';

class AddToCart1 extends StatelessWidget {
  const AddToCart1(
      {super.key, required this.onAddToCart1, required this.product});

  final VoidCallback onAddToCart1;
  final Sneaker product;

  int get quantityState => 1;
  String get defaultSize => sizes[0];
  Color get defaultColor => productColor.color[0];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            cartProvider.addToCart(
                product, quantityState, defaultSize, defaultColor);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    '${product.name} added to cart (Size: $defaultSize, Default color)'),
                duration: const Duration(milliseconds: 1000),
              ),
            );
          },
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            height: 30,
            width: 113,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SvgPicture.string(
                    SvgIcons.cartIcon,
                    color: const Color.fromRGBO(0, 114, 198, 1),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    'Add to Cart',
                    style: GoogleFonts.robotoFlex(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(0, 114, 198, 1),
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
