import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/my_container.dart';
import '../home.dart';

class MyCompletedOrders extends StatelessWidget {
  const MyCompletedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order History',
          style: GoogleFonts.robotoFlex(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            height: 22.27 / 19,
            color: Color.fromRGBO(41, 41, 41, 1),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/order.png'),
            SizedBox(
              height: 15,
            ),
            Text(
              'No completed Order yet',
              style: GoogleFonts.robotoFlex(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                height: 22.27 / 19.0,
              ),
            ),
            MyContainerButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHome(
                              initialIndex: 1,
                            )));
              },
              text: 'Discover products',
            )
          ],
        ),
      ),
    );
  }
}
