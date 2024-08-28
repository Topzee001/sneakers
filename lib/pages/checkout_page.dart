import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sneakers/components/proceed.dart';

import '../components/cancel.dart';
import '../provider/cart_provider.dart';
import '../view_tile/checkout_tile.dart';
import 'payment_bottom_page.dart';

class MyCheckout extends StatefulWidget {
  const MyCheckout({super.key});

  @override
  State<MyCheckout> createState() => _MyCheckoutState();
}

class _MyCheckoutState extends State<MyCheckout> {
  //send order to db method

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    double subtotal = cartProvider.totalPrice;

    // Set delivery fee (you can make this dynamic if needed)
    double deliveryFee = 1550.00;

    // Calculate total
    double total = subtotal + deliveryFee;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: GoogleFonts.robotoFlex(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            height: 22.27 / 19,
            color: Color.fromRGBO(41, 41, 41, 1),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order list',
                          style: GoogleFonts.robotoFlex(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            height: 17.58 / 15,
                            color: Color.fromRGBO(41, 41, 41, 1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text(
                            'Edit',
                            style: GoogleFonts.robotoFlex(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              height: 17.58 / 15,
                              color: Color.fromRGBO(0, 114, 198, 1),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cartProvider.cartItems.length,
                      itemBuilder: (context, index) {
                        final sneakerId =
                            cartProvider.cartItems.keys.elementAt(index);
                        final cartItem = cartProvider.cartItems[sneakerId]!;
                        final product = cartItem.product;

                        return MyCheckoutTile(
                          product: product,
                          cartItem: cartItem,
                          sneakerId: sneakerId,
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 358,
                      height: 104,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Personal information',
                                  style: GoogleFonts.robotoFlex(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    height: 17.58 / 15,
                                    color: Color.fromRGBO(41, 41, 41, 1),
                                  ),
                                ),
                                Text(
                                  'Edit',
                                  style: GoogleFonts.robotoFlex(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    height: 17.58 / 15,
                                    color: Color.fromRGBO(0, 114, 198, 1),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(249, 249, 249, 1),
                              ),
                              // margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(16),
                              height: 74,
                              width: 358,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Ada Dennis',
                                        style: GoogleFonts.robotoFlex(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          height: 14.06 / 12,
                                          color: Color.fromRGBO(42, 42, 42, 1),
                                        ),
                                      ),
                                      Text(
                                        '09100000000',
                                        style: GoogleFonts.robotoFlex(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          height: 14.06 / 12,
                                          color: Color.fromRGBO(42, 42, 42, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    ' ad@gmail.com',
                                    style: GoogleFonts.robotoFlex(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 14.06 / 12,
                                      color: Color.fromRGBO(42, 42, 42, 1),
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 358,
                      height: 78,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery Option',
                                style: GoogleFonts.robotoFlex(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: 17.58 / 15,
                                  color: Color.fromRGBO(42, 42, 42, 1),
                                ),
                              ),
                              Text(
                                'Edit',
                                style: GoogleFonts.robotoFlex(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  height: 17.58 / 15,
                                  color: Color.fromRGBO(0, 114, 198, 1),
                                ),
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(249, 249, 249, 1),
                            ),
                            // margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(16),
                            height: 48,
                            width: 358,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Pick up point',
                                      style: GoogleFonts.robotoFlex(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        height: 14.06 / 12,
                                        color: Color.fromRGBO(42, 42, 42, 1),
                                      ),
                                    ),
                                    Text(
                                      'Ikeja, Lagos',
                                      style: GoogleFonts.robotoFlex(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        height: 14.06 / 12,
                                        color: Color.fromRGBO(42, 42, 42, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 358,
                      height: 190,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price Summary',
                            style: GoogleFonts.robotoFlex(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              height: 17.58 / 15,
                              color: Color.fromRGBO(41, 41, 41, 1),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(249, 249, 249, 1),
                            ),
                            // margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(16),
                            height: 160,
                            width: 358,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total price',
                                      style: GoogleFonts.robotoFlex(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        height: 17.58 / 15,
                                        color: Color.fromRGBO(85, 85, 85, 1),
                                      ),
                                    ),
                                    Text('₦ ${subtotal.toStringAsFixed(2)}'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Delivery fee',
                                      style: GoogleFonts.robotoFlex(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        height: 17.58 / 15,
                                        color: Color.fromRGBO(85, 85, 85, 1),
                                      ),
                                    ),
                                    Text('₦ ${deliveryFee.toStringAsFixed(2)}'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Discount',
                                      style: GoogleFonts.robotoFlex(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        height: 17.58 / 15,
                                        color: Color.fromRGBO(85, 85, 85, 1),
                                      ),
                                    ),
                                    Text('₦ 0.00'),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: GoogleFonts.robotoFlex(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        height: 17.58 / 15,
                                        color: Color.fromRGBO(85, 85, 85, 1),
                                      ),
                                    ),
                                    Text('₦ ${total.toStringAsFixed(2)}'),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 82,
            width: 390,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCancel(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                MyProceed(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: MyPayment(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      // bottomSheet: BottomAppBar(),
    );
  }
}
