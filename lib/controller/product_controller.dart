import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/product_model .dart';

class ProductController extends GetxController {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');

  RxList<Product> products = <Product>[].obs;

  void fetchProductsByCategoryId(String categoryId) async {
    final querySnapshot = await productCollection
        .where('category', isEqualTo: categoryId)
        .get();
    products.value = querySnapshot.docs.map((doc) {
      return Product(
        id: doc.id,
        name: doc['name'],
        price: doc['price'].toDouble(),
        imageUrl: doc['image'],
      );
    }).toList();
  }
}
