import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/const/appconstants.dart';

import '../controller/product_controller.dart';
import '../model/category_model.dart';
import '../model/product_model .dart';

class DetailPage extends StatelessWidget {
  final Category category;
  const DetailPage({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
      final ProductController productController = Get.put(ProductController());
      WidgetsBinding.instance.addPostFrameCallback((_) {
      productController.fetchProductsByCategoryId(category.id);
    });
    return Scaffold(
      appBar: AppBar(title: Text('Products'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Obx(() =>productController.products.isNotEmpty? GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 6, mainAxisSpacing: 5),
          itemCount: productController.products.length,
          itemBuilder: (BuildContext context, int index) {
            final Product product = productController.products[index];
            return Container(
              height: Appconstants.height(context) * 0.2,
              decoration: BoxDecoration(
                  image:  DecorationImage(
                      image: NetworkImage(
                          product.imageUrl),
                      fit: BoxFit.fill),
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15)),
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)),
                          child:  Padding(
                            padding:const EdgeInsets.all(4.0),
                            child: Text(product.name),
                          ),
                        ),
                      )),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)),
                          child:  Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('₹ ${product.price}'),
                          ),
                        ),
                      ))
                ],
              ),
            );
          },
        ):const Center(child: Text('Loading.........'),) ) 
      ),
    );
  }
}
