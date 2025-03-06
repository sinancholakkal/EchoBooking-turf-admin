import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier{
   List<Map<String,dynamic>>categorys = [];
   bool isLoading = false;
  Future<void>addCategory({required String category,required String id})async{
    final instance = FirebaseFirestore.instance;
    await instance.collection('category').doc(id).set({
      "category":category,
      'id':id,
    });
    categorys.add({
      "category":category,
      "id":id,
    });
    notifyListeners();
  }
  Future<void>fetchCategory()async{
   categorys.clear();
   isLoading = true;
   notifyListeners();
    final instance = FirebaseFirestore.instance;
    final catSnap = await instance.collection("category").get();
    for(var cate in catSnap.docs){
      final data = cate.data();
      categorys.add(data);
    }
    isLoading = false;
    notifyListeners();
  }
  Future<void>editCategory({required String category, required String id})async{
    final instance = FirebaseFirestore.instance;
    final cate = instance.collection('category').doc(id);
    cate.update({
      'category':category,
      'id':id,
    });
    fetchCategory();
  }
  Future<void>deleteCategory({ required String id})async{
    final instance = FirebaseFirestore.instance;
    await instance.collection('category').doc(id).delete();
    fetchCategory();
  }
 
}