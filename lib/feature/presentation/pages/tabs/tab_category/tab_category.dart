import 'package:echo_booking_admin/feature/presentation/pages/tabs/tab_category/widget/category_display_section.dart';
import 'package:echo_booking_admin/feature/presentation/pages/tabs/tab_category/widget/top_category_section.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/background_border_widget.dart';
import 'package:flutter/material.dart';

class TabCategory extends StatefulWidget {
  TabCategory({super.key});

  @override
  State<TabCategory> createState() => _TabCategoryState();
}

class _TabCategoryState extends State<TabCategory> {
  late TextEditingController _controller;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundBorderWidget(children: [
      Column(
        children: [
          //Including heading,text formfield and validater button
          TopCategorySection(formKey: _formKey, controller: _controller),
          //Category display Section--------
          CategoryDisplaySection()
        ],
      )
    ]);
  }
}

