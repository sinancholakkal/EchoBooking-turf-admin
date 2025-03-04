import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo_booking_admin/domain/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  Future<List<UserModel>> fetchAllUsers() async {
    List<UserModel> users = [];
    final instance = FirebaseFirestore.instance;
    final userSnap = await instance.collection("userApp").get();
    for (var user in userSnap.docs) {
      final data = user.data();
      final UserModel userModel = UserModel(
        userName: data['name'],
        gender: data['gender'],
        phone: data['phone'],
        address: data['address'],
        userId: data['uid'],
      );
      users.add(userModel);
    }

    return users;
  }
}
