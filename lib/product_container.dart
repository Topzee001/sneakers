import 'package:flutter/material.dart';

class MyProductContainer extends StatelessWidget {
  const MyProductContainer(
      {super.key, required this.content, required this.gradient});

  final LinearGradient gradient;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358,
      height: 200,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: content,
      ),
    );
  }
}
