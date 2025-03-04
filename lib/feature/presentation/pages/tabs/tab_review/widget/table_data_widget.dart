import 'dart:developer';
import 'package:echo_booking_admin/domain/models/turf_model.dart';
import 'package:echo_booking_admin/feature/presentation/pages/screen_turf_update/screen_turf_view.dart';
import 'package:echo_booking_admin/feature/presentation/provider/turf_provider/turf_provider.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/table_data_row.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class TableDataOfReviewWidget extends StatelessWidget {
  const TableDataOfReviewWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<TurfProvider>(context, listen: false)
          .reviewPendigsTurfsEvent(),
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
                TextWidget(text: "No pendigs!"),
              ],
            ),
          );
        }
        final turfs = snapshot.data!;
        //Table Row builder
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: turfs.length,
          itemBuilder: (context, index) {
            TurfModel data = turfs[index];
            log(data.turfName);

            List<String> values = [
              "${index + 1}",
              data.ownerName,
              data.ownerEmail,
              data.turfName,
              data.catogery,
              data.viewAction
            ];
            return TableDataRowWidget(
              values: values,
              data: data,
              viewOnPressed: () {
                Get.to(() => ScreenTurfView(turfModel: data,type: ActionTypeViewTurf.fromReview,));
              },
            );
          },
        );
      },
    );
  }
}
