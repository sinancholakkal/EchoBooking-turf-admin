   import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> alertBox({
    required BuildContext context,
    required Function() onPressed,
        required String title,
    required String content,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
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