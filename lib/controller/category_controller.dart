// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// import '../model/category_model.dart';

// class ProductController extends GetxController {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final CollectionReference collection =
//       FirebaseFirestore.instance.collection('category');

//   RxList<DocumentSnapshot> documents = RxList<DocumentSnapshot>();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchData();
//   }

//   void fetchData() async {
//     // FirebaseFirestore.instance
//     //     .collection('category')
//     //     .get()
//     //     .then((QuerySnapshot querySnapshot) {
//     //   if (querySnapshot.docs.isNotEmpty) {
//     //     List<DocumentSnapshot> documents = querySnapshot.docs;
//     //     for (var document in documents) {
//     //       Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//     //       String documentId = document.id;
//     //       // Object?data = document.data();
//     //       data['id'] = documentId;
//     //       log('${data}--data${documentId}---id');
//     //     }
//     //   }
//     // });
//         QuerySnapshot<Object?> documentSnapshot =await collection.get();
//         log('${documentSnapshot.toString()}------------------');
//     collection.snapshots().listen((QuerySnapshot snapshot) {
//       documents.value = snapshot.docs;
//       log( documents.toString());
//     });
//   }

//   final CollectionReference categoriesCollection =
//       FirebaseFirestore.instance.collection('categories');
//   final CollectionReference productsCollection =
//       FirebaseFirestore.instance.collection('products');

//   RxList<Product> products = <Product>[].obs;

//   void fetchProductsByCategory(String categoryId) async {
//     final querySnapshot =
//         await productsCollection.where('category', isEqualTo: categoryId).get();
//     log(querySnapshot.toString());
//     products.value = querySnapshot.docs
//         .map((doc) => Product(
//               id: doc.id,
//               name: doc['name'],
//               categoryId: doc['category'],
//               image: doc['image'],
//               price: doc['price'],
//             ))
//         .toList();
//   }
// }
import 'dart:developer';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/category_model.dart';

class CategoryController extends GetxController {
  final CollectionReference categoryCollection =
      FirebaseFirestore.instance.collection('category');

  RxList<Category> categories = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    final querySnapshot = await categoryCollection.get();
    categories.value = querySnapshot.docs.map((doc) {
      return Category(
        id: doc.id,
        title: doc['name'],
        image: doc['image'],
      );
    }).toList();
    log(categories.toString());
  }
}
