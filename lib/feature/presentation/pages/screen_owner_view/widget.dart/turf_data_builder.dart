import 'dart:developer';
import 'package:echo_booking_admin/domain/models/owner_model.dart';
import 'package:echo_booking_admin/domain/models/turf_model.dart';
import 'package:echo_booking_admin/feature/presentation/pages/screen_booking_view/screen_booking_view.dart';
import 'package:echo_booking_admin/feature/presentation/pages/screen_turf_update/screen_turf_view.dart';
import 'package:echo_booking_admin/feature/presentation/provider/owner_provider/owner_provider.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/table_data_row.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class TurfDataBuilder extends StatelessWidget {
  const TurfDataBuilder({
    super.key,
    required this.ownerModel,
  });

  final OwnerModel ownerModel;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<OwnerProvider>(context, listen: false)
          .fetchingTurfOfOwner(ownerModel: ownerModel),
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
                TextWidget(text: "No Turfs!"),
              ],
            ),
          );
        }
        final turfs = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: turfs.length,
          itemBuilder: (context, index) {
            TurfModel data = turfs[index];
            log(data.ownerName);
    
            List<String> values = [
              "${index + 1}",
              data.turfName,
              data.email,
              data.phone,
              data.catogery,
              data.viewAction
            ];
            return TableDataRowWidget(
              values: values,
              data: data,
              viewOnPressed: () {
                Get.to(()=>ScreenTurfView(turfModel: data,type: ActionTypeViewTurf.fromView,));
              },
              
            );
          },
        );
      },
    );
  }
}
