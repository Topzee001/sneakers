import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'model/product.dart';
import 'pages/single_product_page.dart';

class MyProductContainer extends StatelessWidget {
  const MyProductContainer(
      {super.key,
      required this.content,
      required this.gradient,
      required this.product});

  final LinearGradient gradient;
  final Widget content;
  final Sneaker product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MySingleProductPage(
                product: product,
                sneakerId: product.id,
              ),
            ));
      },
      child: Container(
        width: 358.w,
        height: 200.h,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: content,
        ),
      ),
    );
  }
}
