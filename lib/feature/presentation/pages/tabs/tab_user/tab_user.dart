import 'package:echo_booking_admin/core/constent/text.dart';
import 'package:echo_booking_admin/feature/presentation/pages/tabs/tab_user/widget/user_data_row_builder.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/background_border_widget.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/table_heading_widget.dart';
import 'package:flutter/material.dart';

class TabUsers extends StatelessWidget {
  const TabUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundBorderWidget(
      children: [
        //Table heading------
        TableHeadingWidget(headigs: headingOfUser),
        //Table row builder
        UserDataRowBuilder(),
      ],
    );
  }
}

