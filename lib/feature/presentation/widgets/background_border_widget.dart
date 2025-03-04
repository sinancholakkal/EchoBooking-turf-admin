import 'package:flutter/material.dart';

class BackgroundBorderWidget extends StatelessWidget {
   BackgroundBorderWidget({
    super.key,
    required this.children
  });
  List<Widget>children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 23, 24, 51),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children
          ),
        ),
      ),
    );
  }
}