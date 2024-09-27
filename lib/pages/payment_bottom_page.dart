import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sneakers/provider/cart_provider.dart';

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
  final _myBox = Hive.box('orderBox');
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

  Future<void> _processPayment(BuildContext context) async {}

  Future<void> _processOrder() async {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    final orders = {
      'name': nameController.text,
      'items': cartProvider.cartItems.values
          .map((item) => {
                'productId': item.product.id,
                'name': item.product.name,
                'price': item.product.price,
                'quantity': item.product.quantity,
                'size': item.size,
                'color': item.color.value,
                'imageUrl': item.product.imageUrl,
              })
          .toList(),
      'totalPrice': cartProvider.totalPrice,
      'timestamp': DateTime.now(),
    };

    await _myBox.put('orders', orders);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyPaymentSuccess(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0.r),
          topRight: Radius.circular(16.0.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16),
            height: 54.h,
            width: 390.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select payment option',
                  style: GoogleFonts.robotoFlex(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    height: 22.27 / 19,
                    color: const Color.fromRGBO(42, 42, 42, 1),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                )
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 16),
              height: 98.h,
              width: 350.w,
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
                      color:
                          const Color.fromRGBO(0, 114, 198, 1).withOpacity(0.2),
                    ),
                  ),
                ],
              )),
          const SizedBox(height: 15),
          SizedBox(
            height: 232.h,
            width: 350.w,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const MyText1(
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
                      const MyText1(
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
                      const MyText1(
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
            const MyBottomContainer(
              text: 'Proceed to payment',
            ),
          if (_isFormValidated)
            MyBottomContainer1(
              text: 'Proceed to payment',
              onTap: () {
                _processOrder();
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
