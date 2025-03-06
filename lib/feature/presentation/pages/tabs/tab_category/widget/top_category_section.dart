import 'package:echo_booking_admin/core/theme/colors.dart';
import 'package:echo_booking_admin/feature/presentation/pages/screen_turf_update/widgets/text_form_widget.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/costum_button.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class TopCategorySection extends StatelessWidget {
  const TopCategorySection({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController controller,
  }) : _formKey = formKey, _controller = controller;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextWidget(
        text: "Category Management",
        fontWeight: FontWeight.bold,
        color: kwhite,
        fontSize: 22,
      ),
    )),
    Form(
        key: _formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 40,
          children: [
            //Text form widget-----------------
            TextFormWidget(
                readOnly: false,
                validator: (value) {
                  if (_controller.text.isEmpty) {
                    return "Please enter the category";
                  } else {
                    return null;
                  }
                },
                labelText: "Category",
                controller: _controller),
            CustomButton(
              text: "Add Category",
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  print(" Validated--------------------");
                } else {
                  print("Not Validated--------------------");
                }
              },
              width: 150,
              color: Colors.green,
              textStyle: TextStyle(color: kwhite),
            )
          ],
        )),
    Padding(
      padding: EdgeInsets.only(top: 40, bottom: 40, left: 40, right: 40),
      child: Divider(),
    )
        ],
      ),
    );
  }
}
