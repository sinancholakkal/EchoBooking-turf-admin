import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo_booking_admin/domain/models/turf_model.dart';
import 'package:flutter/material.dart';

class TurfProvider extends ChangeNotifier {
Stream<List<TurfModel>> reviewPendigsTurfsEvent() async* {
  final instance = FirebaseFirestore.instance;
  List<TurfModel> turfs = [];

  final ownerSnap = await instance.collection("owner").get();

  for (var ownerDoc in ownerSnap.docs) {
    log(ownerDoc.id);
    final ownerData = ownerDoc.data();
    final turfDocs = await ownerDoc.reference.collection("turfs").get();
    
    if (turfDocs.docs.isNotEmpty) {
      for (var turf in turfDocs.docs) {
        final turfData = turf.data();
       if(turfData["reviewStatus"]==false){
         log(turfData.toString());

        final turfModel = TurfModel(
          ownerName: ownerData['name'] ?? "unknown",
          ownerEmail: ownerData['email'],
          turfName: turfData['turfname'],
          phone: turfData['phone'],
          email: turfData['email'],
          price: turfData['price'],
          state: turfData['state'],
          country: turfData['country'],
          catogery: turfData['catogery'],
          includes: turfData['includes'],
          landmark: turfData['landmark'],
          reviewStatus: turfData['reviewStatus'],
        );

        turfs.add(turfModel);
        yield List<TurfModel>.from(turfs);
       }
      }
    }
  }
}
}
