import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/my_bott_container.dart';
import '../home.dart';

class MyPaymentSuccess extends StatelessWidget {
  const MyPaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
// final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
        height: 284,
        width: 390,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: 130,
              child: Column(
                children: [
                  Image.asset('assets/payment_success.png'),
                  Text(
                    'Payment successful',
                    style: GoogleFonts.robotoFlex(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      height: 22.27 / 19,
                      color: Color.fromRGBO(41, 41, 41, 1),
                    ),
                  ),
                  Center(
                    child: Text(
                      'You have successfully placed an order. Details of your order is in your order history.',
                      style: GoogleFonts.robotoFlex(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 17.58 / 15,
                        color: Color.fromRGBO(112, 112, 112, 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
            MyBottomContainer1(
                text: 'OK',
                onTap: () {
                  // cartProvider.clearCart();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHome()));
                })
          ],
        ),
      ),
    );
  }
}
