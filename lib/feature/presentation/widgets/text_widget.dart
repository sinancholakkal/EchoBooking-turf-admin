
import 'dart:ui';

import 'package:echo_booking_admin/core/theme/colors.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  TextWidget({
    super.key,
    required this.text,
    this.color = kwhite,
    this.fontWeight = FontWeight.bold,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize:fontSize ),
    );
  }
}
