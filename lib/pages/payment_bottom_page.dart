import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/my_bott_container.dart';
import '../components/my_text.dart';
import '../components/my_textfield.dart';
import 'payment_success.dart';

class MyPayment extends StatefulWidget {
  const MyPayment({super.key});

  @override
  State<MyPayment> createState() => _MyPaymentState();
}

class _MyPaymentState extends State<MyPayment> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  bool _isFormValidated = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nameController.addListener(_updateFormValidity);
    emailController.addListener(_updateFormValidity);
    phoneController.addListener(_updateFormValidity);
  }

  void _updateFormValidity() {
    setState(() {
      _isFormValidated = nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          phoneController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(left: 16),
            height: 54,
            width: 390,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select payment option',
                  style: GoogleFonts.robotoFlex(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    height: 22.27 / 19,
                    color: Color.fromRGBO(42, 42, 42, 1),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 16),
              height: 98,
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/select_card.png'),
                  Text(
                    'Add a new Card',
                    style: GoogleFonts.robotoFlex(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      height: 17.58 / 15,
                      color: Color.fromRGBO(0, 114, 198, 1).withOpacity(0.2),
                    ),
                  ),
                ],
              )),
          SizedBox(height: 15),
          Container(
            height: 232,
            width: 350,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      MyText1(
                        text: 'Full name',
                      ),
                      MyTextField(
                        controller: nameController,
                        labelText: 'Enter your full name',
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      MyText1(
                        text: 'Email address',
                      ),
                      MyTextField(
                        controller: emailController,
                        labelText: 'Enter your email address',
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      MyText1(
                        text: 'Phone number',
                      ),
                      MyTextField(
                        controller: phoneController,
                        labelText: 'Enter your phone number',
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (!_isFormValidated)
            MyBottomContainer(
              text: 'Proceed to payment',
            ),
          if (_isFormValidated)
            MyBottomContainer1(
              text: 'Proceed to payment',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyPaymentSuccess(),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
