import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/favourite_icon.dart';
import '../constants/svg_icons.dart';
import '../model/product.dart';

import '../pages/single_product_page.dart';
import '../provider/cart_provider.dart';

class GridViewTile extends StatelessWidget {
  final Sneaker product;
  final VoidCallback onAddToCart;

  const GridViewTile(
      {super.key, required this.product, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MySingleProductPage(
                product: product,
                sneakerId: product.id,
              ),
            ));
      },
      child: Container(
        width: 168.5,
        height: 272,
        decoration: BoxDecoration(
          //color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(10),
        //padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(234, 234, 234, 0.4),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: CachedNetworkImage(
                          imageUrl: product.imageUrl,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.shop),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      product.category,
                      style: GoogleFonts.robotoFlex(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        height: 11.72 / 10,
                      ),
                    ),
                    Text(
                      product.name,
                      style: GoogleFonts.robotoFlex(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 14.06 / 12,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.string(SvgIcons.star),
                        Text('4.5(100 sold)')
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '₦ ${product.price.toStringAsFixed(2)}',
                          style: GoogleFonts.robotoFlex(
                            color: Color.fromRGBO(0, 114, 198, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            height: 14.06 / 12,
                          ),
                        ),
                        Text(
                          '₦${(product.price + 10000).toStringAsFixed(2)}',
                          style: GoogleFonts.robotoFlex(
                            decoration: TextDecoration.lineThrough,
                            color: Color.fromRGBO(157, 157, 157, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            height: 14.06 / 12,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 36,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: onAddToCart,
                        icon: SvgPicture.string(SvgIcons.cart),
                        iconSize: 20,
                        // padding: EdgeInsets.all(4),
                        constraints: const BoxConstraints(),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: MyFavourite(
                sneaker: product,
                // onTap: () {
                //   cartProvider.toggleFavourite(product);
                // },
              ),
            )
          ],
        ),
      ),
    );
  }
}
