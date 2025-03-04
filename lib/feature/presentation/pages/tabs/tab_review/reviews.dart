import 'package:echo_booking_admin/core/constent/text.dart';
import 'package:echo_booking_admin/feature/presentation/pages/tabs/tab_review/widget/table_data_widget.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/background_border_widget.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/table_heading_widget.dart';
import 'package:flutter/material.dart';

class TabReviews extends StatelessWidget {
  const TabReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundBorderWidget(children: [
      //Table headings-------------------------------------
      TableHeadingWidget(headigs: headingsOfReviewTurf),
      //Table data----
      TableDataOfReviewWidget()
    ]);
  }
}
