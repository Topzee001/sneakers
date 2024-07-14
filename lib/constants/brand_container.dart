import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'text.dart'; // Ensure the path is correct

class BrandContainer extends StatelessWidget {
  final String svgIcon;
  final String brandName;

  const BrandContainer({
    required this.svgIcon,
    required this.brandName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42,
      height: 158,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: BoxConstraints(
              minWidth: 42,
              minHeight: 64,
            ),
            padding: EdgeInsets.all(4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(249, 249, 249, 1),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  width: 42,
                  height: 48,
                  child: SvgPicture.string(svgIcon),
                ),
                MyText(text: brandName),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
