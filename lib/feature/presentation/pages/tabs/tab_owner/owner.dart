import 'package:echo_booking_admin/core/constent/text.dart';
import 'package:echo_booking_admin/feature/presentation/pages/tabs/tab_owner/widget/owner_table_data_builder.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/background_border_widget.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/table_heading_widget.dart';
import 'package:flutter/material.dart';

class TabOwners extends StatelessWidget {
  const TabOwners({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundBorderWidget(
      children: [
        //Table headings-------------
        TableHeadingWidget(headigs: headingOfOwner),
        //Table data builder----------
        OwnerTableDataBuilder()
      ],
    );
  }
}

