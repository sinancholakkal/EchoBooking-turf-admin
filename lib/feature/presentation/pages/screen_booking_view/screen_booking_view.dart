import 'package:echo_booking_admin/core/constent/text.dart';
import 'package:echo_booking_admin/core/theme/colors.dart';
import 'package:echo_booking_admin/domain/models/bookings_model.dart';
import 'package:echo_booking_admin/feature/presentation/provider/owner_provider/owner_provider.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/background_border_widget.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/table_data_row.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/table_heading_widget.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        FutureBuilder(
          future: Provider.of<OwnerProvider>(context, listen: false)
              .fetchTurfBookings(ownerId: ownerId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                children: [
                  SizedBox(
                    height: 300,
                  ),
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              );
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                    ),
                    TextWidget(text: "No Bookings!"),
                  ],
                ),
              );
            }
            final bookings = snapshot.data;
            return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: bookings!.length,
          itemBuilder: (context, index) {
            BookingModel data = bookings[index];
    
            List<String> values = [
                "${index + 1}",
                data.userName,
                data.userPhone,
                data.turfName,
                data.bookingDate,
                "${data.bookingTime}*${data.slotDate}",
                data.price,
                data.paymentId
              ];
            return TableDataRowWidget(
              values: values,
              data: data,
              viewOnPressed: () {
                //Get.to(()=>ScreenTurfView(turfModel: data,type: ActionTypeViewTurf.fromView,));
              },
              //bookingOnPressed: () => Get.to(()=>ScreenBookingView(ownerId: data.ownerId,)),
            );
          },
        );
          },
        ),
      ]),
    );
  }
}
