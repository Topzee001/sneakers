import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/cart.dart';
import '../model/product.dart';

class MyCartItemTile extends StatefulWidget {
  const MyCartItemTile({
    super.key,
    required this.product,
    required this.onRemove,
    required this.onQuantityChanged,
    required this.cartItem,
    required this.SneakerId,
  });
  final Sneaker product;
  final String SneakerId;
  final CartItem cartItem;
  final VoidCallback onRemove;
  // final Function(String) onSizeChanged;
  final Function(int) onQuantityChanged;

  @override
  State<MyCartItemTile> createState() => _MyCartItemState();
}

class _MyCartItemState extends State<MyCartItemTile> {
  @override
  Widget build(BuildContext context) {
    //padding 16, margin 16, radius 8
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        //margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 112,
        width: 358,
        child: Stack(
          children: [
            ListTile(
              leading: Container(
                height: 120,
                // width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: widget.product.imageUrl,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.shop),
                    fit: BoxFit.cover,
                    height: 120,
                    // width: 50,
                  ),
                ),
              ),
              title: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                height: 56,
                width: 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 18,
                      width: 210,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.product.name,
                            style: GoogleFonts.robotoFlex(
                              color: Color.fromRGBO(42, 42, 42, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              height: 17.58 / 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 26,
                      width: 166,
                      child: Row(
                        children: [
                          //add color text widget
                          Text(
                            'color:  ',
                            style: GoogleFonts.robotoFlex(
                              color: Color.fromRGBO(85, 85, 85, 1),
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
                          VerticalDivider(
                            color: Colors.black,
                            thickness: 0.5,
                            width: 16,
                          ),
                  
                          //add size widget
                          Text(
                            ' Size ${widget.cartItem.size}',
                            style: GoogleFonts.robotoFlex(
                              color: Color.fromRGBO(42, 42, 42, 1),
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
              subtitle: Container(
                height: 34,
                width: 210,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      height: 34,
                      width: 105,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color.fromRGBO(249, 249, 249, 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 16,
                            width: 16,
                            child: IconButton(
                              padding: EdgeInsets.all(0.0),
                              icon: Icon(
                                Icons.remove,
                                size: 15,
                              ),
                              onPressed: () {
                                if (widget.cartItem.quantity > 1) {
                                  widget.onQuantityChanged(
                                      widget.cartItem.quantity - 1);
                                }
                              },
                            ),
                          ),
                          Container(
                              height: 26,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Container(
                                  width: 25,
                                  height: 26,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: Color.fromRGBO(0, 114, 198, 0.12)),
                                  child: Center(
                                    child: Text(
                                      '${widget.cartItem.quantity}',
                                    ),
                                  ))),
                          Container(
                            height: 16,
                            width: 16,
                            child: IconButton(
                              padding: EdgeInsets.all(0.0),
                              icon: Icon(
                                Icons.add,
                                size: 15,
                              ),
                              onPressed: () {
                                widget.onQuantityChanged(
                                    widget.cartItem.quantity + 1);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '₦${(widget.product.price * widget.cartItem.quantity).toStringAsFixed(2)}',
                      style: GoogleFonts.robotoFlex(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 17.58 / 15,
                        color: Color.fromRGBO(42, 42, 42, 1),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left:15.0),
                child: IconButton(
                  onPressed: widget.onRemove,
                  icon: Icon(Icons.close),
                ),
              ))
          ],
        ),
      ),
    );
  }
}
