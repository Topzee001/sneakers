import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/cart.dart';
import '../model/product.dart';

class MyCheckoutTile extends StatelessWidget {
  const MyCheckoutTile({
    super.key,
    required this.product,
    required this.cartItem,
    required this.sneakerId,
  });

  final Sneaker product;
  final String sneakerId;
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 112,
        width: 358,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: product.imageUrl,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.shop),
              fit: BoxFit.cover,
              height: 120,
            ),
          ),
          title: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: GoogleFonts.robotoFlex(
                    color: const Color.fromRGBO(42, 42, 42, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Color: ',
                      style: GoogleFonts.robotoFlex(
                        color: const Color.fromRGBO(85, 85, 85, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: cartItem.color,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Size: ${cartItem.size}',
                      style: GoogleFonts.robotoFlex(
                        color: const Color.fromRGBO(42, 42, 42, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Qty: ${cartItem.quantity}',
                style: GoogleFonts.robotoFlex(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '₦${(product.price * cartItem.quantity).toStringAsFixed(2)}',
                style: GoogleFonts.robotoFlex(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(42, 42, 42, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
