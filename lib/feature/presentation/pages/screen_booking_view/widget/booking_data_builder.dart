import 'package:echo_booking_admin/domain/models/bookings_model.dart';
import 'package:echo_booking_admin/feature/presentation/provider/owner_provider/owner_provider.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/table_data_row.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookigDataBulder extends StatelessWidget {
  const BookigDataBulder({
    super.key,
    required this.ownerId,
  });

  final String ownerId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
              viewOnPressed: () {},
            );
          },
        );
      },
    );
  }
}
