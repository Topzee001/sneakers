
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sneakers/provider/cart_provider.dart';
import 'package:sneakers/view_tile/cart_item_tile.dart';

import '../components/checkout_button.dart';
import '../home.dart';
import 'checkout_page.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MyHome()),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Cart',
            style: GoogleFonts.robotoFlex(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              height: 22.27 / 19,
              color: Color.fromRGBO(41, 41, 41, 1),
            ),
          ),
        ),
        body: cartProvider.cartItems.isEmpty
            ? Center(
                child: Text(
                'No items added to cart',
                style: GoogleFonts.robotoFlex(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  height: 22.27 / 19.0,
                ),
              ))
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartProvider.cartItems.length,
                      itemBuilder: (context, index) {
                        final sneakerId =
                            cartProvider.cartItems.keys.elementAt(index);
                        final cartItem = cartProvider.cartItems[sneakerId]!;

                        return MyCartItemTile(
                          product: cartItem.product,
                          onRemove: () {
                            cartProvider.removeFromCart(sneakerId);
                          },
                          onQuantityChanged: (newQuantity) {
                            cartProvider.updateQuantity(sneakerId, newQuantity);
                          },
                          cartItem: cartItem,
                          sneakerId: sneakerId,
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      //color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 390,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total price',
                              style: GoogleFonts.robotoFlex(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(157, 157, 157, 1),
                              ),
                            ),
                            //Text('₦ ${widget.product.price.toStringAsFixed(2)}'),
                            Text(
                              //'₦ ${(widget.product.price * quantityState).toStringAsFixed(2)}',
                              '₦ ${cartProvider.totalPrice.toStringAsFixed(2)}',
                            ),
                          ],
                        ),
                        //Spacer(),
                        MyCheckoutButton(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyCheckout(),
                                ));
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}


// Navigator.push(
                    // context,
                    // MaterialPageRoute(
                    //   builder: (context) => MyHome(
                    //       //initialIndex: 3, // Index for the profile page
                    //       ),
                    // )
                    // );