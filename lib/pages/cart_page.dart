import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneakers/pages/profile.dart';

import '../home.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('My Cart',
              style: GoogleFonts.robotoFlex(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                height: 22.27 / 19,
                color: Color.fromRGBO(41, 41, 41, 1),
              ))),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHome(
                        //initialIndex: 3, // Index for the profile page
                        ),
                  ));
            },
            child: Text('goto profile')),
      ),
    );
  }
}
