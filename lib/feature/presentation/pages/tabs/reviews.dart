import 'dart:developer';

import 'package:echo_booking_admin/core/theme/colors.dart';
import 'package:echo_booking_admin/feature/presentation/pages/screen_turf_update/screen_turf_view.dart';
import 'package:echo_booking_admin/feature/presentation/provider/turf_provider/turf_provider.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class TabReviews extends StatefulWidget {
  const TabReviews({super.key});

  @override
  State<TabReviews> createState() => _TabReviewsState();
}

class _TabReviewsState extends State<TabReviews> {
@override
  void initState() {
    log("inistate called");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // Provider.of<TurfProvider>(context,listen: false).reviewPendigsTurfsEvent();
    //context.watch<TurfProvider>();
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 23, 24, 51),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                height: 40,
                color: Colors.blue,
                child: Table(
                  border: TableBorder.all(
                    color: kblue,
                    width: 3,
                    //style: BorderStyle.solid,
                  ),
                  children: [
                    TableRow(children: [
                      Column(
                        children: [
                          TextWidget(text: "No"),
                        ],
                      ),
                      Column(
                        children: [
                          TextWidget(text: "Owner name"),
                        ],
                      ),
                      Column(
                        children: [
                          TextWidget(text: "Owner e-mail"),
                        ],
                      ),
                      Column(
                        children: [
                          TextWidget(text: "Turf name"),
                        ],
                      ),
                      Column(
                        children: [
                          TextWidget(text: "Category"),
                        ],
                      ),
                      Column(
                        children: [
                          TextWidget(text: "Action"),
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
              StreamBuilder(
                stream: Provider.of<TurfProvider>(context, listen: false)
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
                  final data = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final data = snapshot.data![index];
                      return Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(children: [
                            //Nomber of turfs
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: TableCell(
                                      child: TextWidget(text: "${index + 1}"))),
                            ),
                            //Owner name-----------
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: TableCell(
                                      child: TextWidget(text: data.ownerName))),
                            ),
                            //Owner email--------------------
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: TableCell(
                                      child:
                                          TextWidget(text: data.ownerEmail))),
                            ),
                            //turf name------------------
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: TableCell(
                                      child: TextWidget(text: data.turfName))),
                            ),
                            // catogery-------------
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: TableCell(
                                      child: TextWidget(text: data.catogery))),
                            ),
                            //Action--------------------
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: TableCell(
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Get.to(() => ScreenTurfView(
                                                turfModel: data));
                                          },
                                          child: Text("View")))),
                            ),
                          ])
                        ],
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
