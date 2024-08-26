import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../provider/cart_provider.dart';

class MyFavourite extends StatefulWidget {
  const MyFavourite({super.key, this.onTap, required this.sneaker});

  final VoidCallback? onTap;
  final Sneaker sneaker;

  @override
  State<MyFavourite> createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return GestureDetector(
      onTap: () {
        cartProvider.toggleFavourite(widget.sneaker);
        setState(() {
          // isFavourite = !isFavourite;
        });
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(6.4),
        child: Container(
          width: 30.8,
          height: 30.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: cartProvider.isExist(widget.sneaker)
                  ? Colors.red
                  : Colors.grey.shade700),
          child: Center(
            child: Icon(
              size: 17,
              cartProvider.isExist(widget.sneaker)
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// SvgPicture.string(
//               SvgIcons.likeBox,
//               // ignore: deprecated_member_use
//               color: isFavourite ? Colors.white : Colors.white,
//               fit: BoxFit.fill,

//               //fit: BoxFit.cover,
//               height: 18,
//               width: 18,
//             ),