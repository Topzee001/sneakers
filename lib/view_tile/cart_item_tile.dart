import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    required this.sneakerId,
  });
  final Sneaker product;
  final String sneakerId;
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
        height: 112.h,
        width: 358.w,
        child: Stack(
          children: [
            ListTile(
              leading: Container(
                height: 120.h,
                width: 100.w,
                decoration: BoxDecoration(
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
                    height: 120.h,
                    // width: 50,
                  ),
                ),
              ),
              title: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: 56.h,
                width: 210.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 18.h,
                      //width: 210.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.product.name,
                            style: GoogleFonts.robotoFlex(
                              color: const Color.fromRGBO(42, 42, 42, 1),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              height: 17.58 / 15,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 26.h,
                      width: 166.w,
                      child: Row(
                        children: [
                          //add color text widget
                          Text(
                            'color:  ',
                            style: GoogleFonts.robotoFlex(
                              color: const Color.fromRGBO(85, 85, 85, 1),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              height: 14.06 / 12,
                            ),
                          ),
                          Container(
                            height: 20.h,
                            width: 20.w,
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
                              fontSize: 15.sp,
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
                height: 34.h,
                width: 210.w,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: 34.h,
                      width: 105.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color.fromRGBO(249, 249, 249, 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 16.h,
                            width: 16.w,
                            child: IconButton(
                              padding: const EdgeInsets.all(0.0),
                              icon: const Icon(
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
                              height: 26.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Container(
                                  width: 25.w,
                                  height: 26.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: const Color.fromRGBO(0, 114, 198, 0.12)),
                                  child: Center(
                                    child: Text(
                                      '${widget.cartItem.quantity}',
                                    ),
                                  ))),
                          SizedBox(
                            height: 16.h,
                            width: 16.w,
                            child: IconButton(
                              padding: const EdgeInsets.all(0.0),
                              icon: const Icon(
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
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        height: 17.58 / 15,
                        color: const Color.fromRGBO(42, 42, 42, 1),
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
                  padding: const EdgeInsets.only(left: 15.0),
                  child: IconButton(
                    onPressed: widget.onRemove,
                    icon: const Icon(Icons.close),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
