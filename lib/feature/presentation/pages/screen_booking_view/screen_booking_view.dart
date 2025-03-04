import 'package:echo_booking_admin/core/constent/text.dart';
import 'package:echo_booking_admin/core/theme/colors.dart';
import 'package:echo_booking_admin/feature/presentation/pages/screen_booking_view/widget/booking_data_builder.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/background_border_widget.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/table_heading_widget.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
class ScreenBookingView extends StatelessWidget {
  final String ownerId;
  ScreenBookingView({super.key, required this.ownerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        title: TextWidget(text: "Bookings"),
        centerTitle: true,
        iconTheme: IconThemeData(color: kwhite),
        backgroundColor: backGroundColor,
      ),
      body: BackgroundBorderWidget(children: [
        TableHeadingWidget(headigs: headingOfBooking),
        //Table data row builder
        BookigDataBulder(ownerId: ownerId),
      ]),
    );
  }
}

