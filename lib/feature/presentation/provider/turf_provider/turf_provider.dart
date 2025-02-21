import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo_booking_admin/domain/models/turf_model.dart';
import 'package:flutter/material.dart';

class TurfProvider extends ChangeNotifier {
  //Fetching turfs for review------------------
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
          if (turfData["reviewStatus"] == "false") {
            log(turfData.toString());

            final turfModel = TurfModel(
                ownerId: ownerData['uid'],
                turfId: turfData['turfid'],
                ownerName: ownerData['name'],
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
                images: turfData["images"]);

            turfs.add(turfModel);
            yield List<TurfModel>.from(turfs);
          }
        }
      }
    }
  }

  Future<void> upproveOrRejectTurfEvent({required String ownerId,required String turfId,required String status}) async {
    final instance = FirebaseFirestore.instance;
    final owner = instance.collection("owner").doc(ownerId);
    await owner.collection("turfs").doc(turfId).update({
      "reviewStatus": status,
    });
  }
}
