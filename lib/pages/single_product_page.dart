import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/product.dart';

class MySingleProductPage extends StatelessWidget {
  const MySingleProductPage({
    super.key,
    required this.product,
    //required this.onAddToCart,
  });
  final Sneaker product;
  // final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            color: Color.fromRGBO(255, 253, 253, 1),
            height: 399,
            width: 390,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.all(90),
                height: 240,
                width: 240,
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.shop),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.category,
                  style: GoogleFonts.robotoFlex(
                    fontSize: 12,
                  ),
                ),
                Text(
                  product.name,
                  style: GoogleFonts.robotoFlex(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '₦${product.price.toStringAsFixed(2)}',
                  style: GoogleFonts.robotoFlex(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
