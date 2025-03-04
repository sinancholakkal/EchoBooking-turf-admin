import 'package:echo_booking_admin/core/constent/text.dart';
import 'package:echo_booking_admin/core/theme/colors.dart';
import 'package:echo_booking_admin/domain/models/owner_model.dart';
import 'package:echo_booking_admin/feature/presentation/pages/screen_owner_view/widget.dart/turf_data_builder.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/background_border_widget.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/table_heading_widget.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ScreenOwnerView extends StatelessWidget {
  final OwnerModel ownerModel;
  ScreenOwnerView({super.key, required this.ownerModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: TextWidget(text: "Turfs"),
        centerTitle: true,
        iconTheme: IconThemeData(color: kwhite),
      ),
      body: BackgroundBorderWidget(
        children: [
          TableHeadingWidget(headigs: headingOfOwnerTurfView),
          TurfDataBuilder(ownerModel: ownerModel)
        ],
      ),
    );
  }
}

