import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/my_bott_container.dart';
import '../home.dart';
import '../provider/cart_provider.dart';

class MyPaymentSuccess extends StatelessWidget {
  const MyPaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          width: 390,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                child: Column(
                  children: [
                    Image.asset('assets/payment_success.png'),
                    SizedBox(height: 20),
                    Text(
                      'Payment successful',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoFlex(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        height: 22.27 / 19,
                        color: Color.fromRGBO(41, 41, 41, 1),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'You have successfully placed an order. Details of your order is in your order history.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoFlex(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 17.58 / 15,
                        color: Color.fromRGBO(112, 112, 112, 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              MyBottomContainer1(
                text: 'OK',
                onTap: () {
                  cartProvider.clearCart();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHome()),
                    (Route<dynamic> route) => false,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
