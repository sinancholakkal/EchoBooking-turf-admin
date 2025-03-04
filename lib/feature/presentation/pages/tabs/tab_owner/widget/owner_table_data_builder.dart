import 'dart:developer';

import 'package:echo_booking_admin/domain/models/owner_model.dart';
import 'package:echo_booking_admin/feature/presentation/pages/screen_booking_view/screen_booking_view.dart';
import 'package:echo_booking_admin/feature/presentation/pages/screen_owner_view/screen_owner_view.dart';
import 'package:echo_booking_admin/feature/presentation/provider/owner_provider/owner_provider.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/table_data_row.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OwnerTableDataBuilder extends StatelessWidget {
  const OwnerTableDataBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<OwnerProvider>(context, listen: false).fetchOwners(),
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
                TextWidget(text: "No Owners!"),
              ],
            ),
          );
        }
        final owner = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: owner.length,
          itemBuilder: (context, index) {
            OwnerModel data = owner[index];
            log(data.ownerName);

            List<String> values = [
              "${index + 1}",
              data.ownerName,
              data.ownerEmail,
              data.ownerPhone,
              data.bookingAction,
              data.viewAction
            ];
            return TableDataRowWidget(
              values: values,
              data: data,
              bookingOnPressed: () =>
                  Get.to(() => ScreenBookingView(ownerId: data.ownerId)),
              viewOnPressed: () {
                Get.to(
                  () => ScreenOwnerView(
                    ownerModel: data,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
