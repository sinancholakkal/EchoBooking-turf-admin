import 'package:echo_booking_admin/core/constent/size.dart';
import 'package:echo_booking_admin/core/theme/colors.dart';
import 'package:echo_booking_admin/domain/models/turf_model.dart';
import 'package:echo_booking_admin/feature/presentation/pages/screen_home/screen_home.dart';
import 'package:echo_booking_admin/feature/presentation/pages/screen_turf_update/widgets/image_frame_widget.dart';
import 'package:echo_booking_admin/feature/presentation/pages/screen_turf_update/widgets/text_form_widget.dart';
import 'package:echo_booking_admin/feature/presentation/provider/turf_provider/turf_provider.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/alert_box_widget.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/costum_button.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/heading_text.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/loading_widget.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenTurfView extends StatefulWidget {
  final TurfModel turfModel;
  ScreenTurfView({super.key, required this.turfModel});

  @override
  State<ScreenTurfView> createState() => _ScreenTurfUpdateState();
}

class _ScreenTurfUpdateState extends State<ScreenTurfView> {
  late ValueNotifier<String> initialDropDown;
  late TextEditingController _turfName;
  late TextEditingController _phone;
  late TextEditingController _email;
  late TextEditingController _price;
  late TextEditingController _inclueds;
  late TextEditingController _landmark;
  late TextEditingController _state;
  late TextEditingController _country;
  late TextEditingController _catogery;
  late TextEditingController _rejectTurf;

  @override
  void initState() {
    _turfName = TextEditingController(text: widget.turfModel.turfName);
    _phone = TextEditingController(text: widget.turfModel.phone);
    _email = TextEditingController(text: widget.turfModel.email);
    _price = TextEditingController(text: widget.turfModel.price);
    _inclueds = TextEditingController(text: widget.turfModel.includes);
    _landmark = TextEditingController(text: widget.turfModel.landmark);
    _state = TextEditingController(text: widget.turfModel.state);
    _country = TextEditingController(text: widget.turfModel.country);
    _catogery = TextEditingController(text: widget.turfModel.catogery);
    _rejectTurf = TextEditingController(text: "You have to add more clear details");
    super.initState();
  }

  @override
  void dispose() {
    _turfName.dispose();
    _catogery.dispose();
    _phone.dispose();
    _email.dispose();
    _price.dispose();
    _landmark.dispose();
    _state.dispose();
    _country.dispose();
    _inclueds.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 1000,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 23, 24, 51),
                      ),
                      child: Column(
                        spacing: 20,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          height10,
                          HeadingText(text: "Details about Turf"),
                          height20,
                          //Turf name field-----------------------
                          TextFormWidget(
                            labelText: "Turf name",
                            controller: _turfName,
                          ),

                          //Catogery--------
                          TextFormWidget(
                            labelText: "Catogery",
                            controller: _catogery,
                          ),

                          //phone number field---------------

                          TextFormWidget(
                            labelText: "Phone",
                            controller: _phone,
                          ),
                          //Email field------------
                          TextFormWidget(
                            labelText: "Email",
                            controller: _email,
                          ),
                          //Country-----------
                          TextFormWidget(
                            labelText: "Country",
                            controller: _country,
                          ),

                          //State---------
                          TextFormWidget(
                            labelText: "State",
                            controller: _state,
                          ),
                          //Price field------------------
                          TextFormWidget(
                            labelText: "Price",
                            controller: _price,
                          ),
                          TextFormWidget(
                            labelText: "Includes",
                            controller: _inclueds,
                            maxLine: 5,
                          ),

                          TextFormWidget(
                            labelText: "Landmark",
                            controller: _landmark,
                            maxLine: 3,
                          ),

                          height20,

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8,
                            children: [
                              //Approve button--------------
                              CustomButton(
                                text: "Approve Turf",
                                onTap: () {
                                  alertBox(
                                      context: context,
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        loadingWidget(context);
                                        Provider.of<TurfProvider>(context,
                                                listen: false)
                                            .upproveOrRejectTurfEvent(
                                              ownerId: widget.turfModel.ownerId,
                                              turfId: widget.turfModel.turfId,
                                                status: "true",
                                                
                                                );
                                        await Future.delayed(
                                            Duration(seconds: 3));
                                        Provider.of<TurfProvider>(context,
                                                listen: false)
                                            .reviewPendigsTurfsEvent();
                                        Navigator.pop(context);
                                        Navigator.of(context)
                                            .pushReplacement(MaterialPageRoute(
                                                builder: (ctx) => ScreenHome(
                                                      initialTab: 2,
                                                    )));
                                      },
                                      title: "Approve",
                                      content:
                                          "Are you sure want to approve this turf?");
                                },
                                width: 170,
                              ),
                              //Rejection button--------------
                              CustomButton(
                                  width: 160,
                                  text: "Reject Turf",
                                  onTap: () {
                                    alertBox(
                                        context: context,
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          loadingWidget(context);
                                          Provider.of<TurfProvider>(context,
                                                  listen: false)
                                              .upproveOrRejectTurfEvent(
                                            ownerId: widget.turfModel.ownerId,
                                            turfId: widget.turfModel.turfId,
                                            status: "rejected*${_rejectTurf.text}",
                                          );
                                          await Future.delayed(
                                              Duration(seconds: 3));
                                          Provider.of<TurfProvider>(context,
                                                  listen: false)
                                              .reviewPendigsTurfsEvent();
                                          Navigator.pop(context);
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (ctx) => ScreenHome(
                                                        initialTab: 2,
                                                      )));
                                        },
                                        title: "Reject",
                                        contentWidget: SizedBox(
                                          width: 300,
                                          child: TextFormField(
                                            controller: _rejectTurf,
                                            maxLines: 5,
                                            
                                            decoration: InputDecoration(
                                                labelText: "Add reason",
                                                border: OutlineInputBorder()),
                                          ),
                                        ));
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  //Images part--------------------------
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      // width: screenWidth *0.45,
                      height: 1000,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 23, 24, 51),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          HeadingText(text: "Image:"),
                          height10,
                          Wrap(
                            direction: Axis.horizontal,
                            children: List.generate(
                              widget.turfModel.images.length,
                              (index) => ImageFrameWidget(
                                  image: widget.turfModel.images[index]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
