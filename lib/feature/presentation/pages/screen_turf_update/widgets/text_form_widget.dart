
import 'package:echo_booking_admin/core/constent/size.dart';
import 'package:echo_booking_admin/core/theme/colors.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final double width;
  final int maxLine;
  final String labelText;
  final controller;
  final bool readOnly;
  String? Function(String?)? validator;
  TextFormWidget({
    required this.labelText,
    super.key,
    required this.controller,
    this.width = 600,
    this.maxLine = 1,
    this.validator,
    this.readOnly = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        validator:validator ,
        controller: controller,
        readOnly: readOnly,
        maxLines: maxLine,
        style: TextStyle(color: kwhite),
        
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: kwhite),
            enabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(width: 3, color: Colors.grey),
              borderRadius: radius,
            ),
            // Set border for focused state
            focusedBorder: OutlineInputBorder(
              borderSide:
                   BorderSide(width: borderWidth, color:Colors.grey ),
              borderRadius: radius,
            ),
            errorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: borderWidth, color: Colors.grey),
              borderRadius: radius,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: borderWidth, color: Colors.grey),
              borderRadius: radius,
            )),
      ),
    );
  }
}
