import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo_booking_admin/domain/models/bookings_model.dart';
import 'package:echo_booking_admin/domain/models/owner_model.dart';
import 'package:echo_booking_admin/domain/models/turf_model.dart';
import 'package:flutter/material.dart';

class OwnerProvider extends ChangeNotifier {
  //Fetching all owners
  Future<List<OwnerModel>> fetchOwners() async {
    List<OwnerModel> owners = [];
    final instance = FirebaseFirestore.instance;
    final ownerSnap = await instance.collection("owner").get();
    for (var owner in ownerSnap.docs) {
      final ownerData = owner.data();
      final OwnerModel model = OwnerModel(
        ownerName: ownerData['name'],
        ownerEmail: ownerData['email'],
        ownerPhone: ownerData['phone'],
        ownerId: ownerData['uid'],
      );
      owners.add(model);
    }
    return owners;
  }

  //Fetching turf detais of owner
  Future<List<TurfModel>> fetchingTurfOfOwner(
      {required OwnerModel ownerModel}) async {
    final List<TurfModel> turfModels = [];
    final instance = FirebaseFirestore.instance;
    final turfSnap = await instance
        .collection("owner")
        .doc(ownerModel.ownerId)
        .collection('turfs')
        .get();
    for (var turf in turfSnap.docs) {
      final turfData = turf.data();
      final turfModel = TurfModel(
        ownerId: ownerModel.ownerId,
        turfId: turfData['turfid'],
        ownerName: ownerModel.ownerName,
        ownerEmail: ownerModel.ownerEmail,
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
        images: turfData["images"],
      );
      turfModels.add(turfModel);
    }
    return turfModels;
  }

  Future<List<BookingModel>> fetchTurfBookings(
      {required String ownerId}) async {
    final List<BookingModel> bookings = [];
    final instance = FirebaseFirestore.instance;
    final bookingsSnap = await instance
        .collection("owner")
        .doc(ownerId)
        .collection('bookings')
        .get();

    for (var booking in bookingsSnap.docs) {
      final data = booking.data();
      final BookingModel model = BookingModel(
        slotDate: data['slotdate']??"Unknown",
        price: data['price'],
        paymentId: data['paymentid'],
        bookingDate: data['bookingdate']??"Unknown",
        userName: data['username'],
        bookingTime: data['bookingtime'],
        catogery: data['catogery'],
        turfName: data['turfname'],
        userPhone: data['userphone'],
      );
      bookings.add(model);
    }
    return bookings;
  }
}
