import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/cart.dart';
import '../model/product.dart';

class MyCheckoutTile extends StatefulWidget {
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
  State<MyCheckoutTile> createState() => _MyCartItemState();
}

class _MyCartItemState extends State<MyCheckoutTile> {
  @override
  Widget build(BuildContext context) {
    //padding 16, margin 16, radius 8
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        //margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.shade200),
          color: const Color.fromRGBO(249, 249, 249, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 112,
        width: 358,
        child: ListTile(
          leading: AspectRatio(
            aspectRatio: 1,
            child: Container(
              height: 120,
              width: 100, // Fixed width for image container
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: widget.product.imageUrl,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.shop),
                  fit: BoxFit.cover,
                  height: 120,
                  // width: 50,
                ),
              ),
            ),
          ),
          title: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 56,
            width: 210,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18,
                  width: 210,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.name,
                        style: GoogleFonts.robotoFlex(
                          color: const Color.fromRGBO(42, 42, 42, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 17.58 / 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 26,
                  width: 166,
                  child: Row(
                    children: [
                      //add color text widget
                      Text(
                        'color:  ',
                        style: GoogleFonts.robotoFlex(
                          color: const Color.fromRGBO(85, 85, 85, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 14.06 / 12,
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: widget.cartItem.color,
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.black,
                        thickness: 0.5,
                        width: 16,
                      ),

                      //add size widget
                      Text(
                        ' Size ${widget.cartItem.size}',
                        style: GoogleFonts.robotoFlex(
                          color: const Color.fromRGBO(42, 42, 42, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 14.06 / 12,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          subtitle: SizedBox(
            height: 34,
            width: 210,
            child: Row(
              children: [
                Container(
                  width: 25,
                  height: 26,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: const Color.fromRGBO(0, 114, 198, 0.12)),
                  child: Center(
                    child: Text(
                      '${widget.cartItem.quantity}',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                    ' ₦${(widget.product.price * widget.cartItem.quantity).toStringAsFixed(2)}',
                    style: GoogleFonts.robotoFlex(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      height: 17.58 / 15,
                      color: const Color.fromRGBO(42, 42, 42, 1),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
