   import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> alertBox({
    required BuildContext context,
    required Function() onPressed,
        required String title,
    String? content,
    Widget? contentWidget,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content:content==null?contentWidget: Text(content),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("cancel")),
            TextButton(onPressed: onPressed, child: Text("Ok"))
          ],
        );
      },
    );
  }