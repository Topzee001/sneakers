import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/svg_icons.dart';

class MyFavourite extends StatefulWidget {
  const MyFavourite({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  State<MyFavourite> createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavourite = !isFavourite;
        });
        widget.onTap;
      },
      child: Padding(
        padding: const EdgeInsets.all(6.4),
        child: Container(
          width: 30.8,
          height: 30.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: isFavourite ? Colors.red : Colors.grey.shade700),
          child: Container(
            margin: const EdgeInsets.all(8),
            width: 18,
            height: 18,
            child: SvgPicture.string(
              SvgIcons.likeBox,
              // ignore: deprecated_member_use
              color: isFavourite ? Colors.white : Colors.white,
              fit: BoxFit.fill,

              //fit: BoxFit.cover,
              height: 18,
              width: 18,
            ),
          ),
        ),
      ),
    );
  }
}
