import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference collection = FirebaseFirestore.instance.collection('category');

  
  RxList<DocumentSnapshot> documents = RxList<DocumentSnapshot>();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    collection.snapshots().listen((QuerySnapshot snapshot) {
      documents.value = snapshot.docs;
    });
  }
}