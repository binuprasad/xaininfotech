import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/const/appconstants.dart';
import 'package:get_it/controller/product_controller.dart';

class ProductHome extends StatelessWidget {
  ProductHome({super.key});
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: Appconstants.height(context) * 0.07,
          width: Appconstants.width(context) * 0.3,
          decoration: const BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
                image: AssetImage('assets/images/applogo.jpeg'),
                fit: BoxFit.fill),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code_scanner)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Product...',
                            hintStyle: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: Appconstants.height(context) * 0.06,
                        width: Appconstants.height(context) * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green),
                        child: const Center(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: Appconstants.height(context) * 0.27,
                width: Appconstants.width(context),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/products.jpeg'),
                      fit: BoxFit.fill),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'View All➔',
                    style: TextStyle(color: Colors.amber),
                  )
                ],
              ),
              SizedBox(
                  height: Appconstants.height(context) * 0.3,
                  child: Obx(
                    () => productController.documents.isEmpty
                        ? const Center(
                            child: Text('Loading...'),
                          )
                        : GridView.builder(
                          primary: false,
                            itemCount: productController.documents.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> data =
                                  productController.documents[index].data()
                                      as Map<String, dynamic>;
                              return Column(
                                children: [
                                  Container(
                                    height: Appconstants.height(context) * 0.11,
                                    width: Appconstants.width(context) * 0.19,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(data['image']),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  Text(
                                    data['name'],  overflow: TextOverflow.ellipsis,
  maxLines: 1,
                                    style: TextStyle(fontSize: 13),
                                  )
                                ],
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 0.9,
                            ),
                          ),
                  )),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Brands',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'View All➔',
                    style: TextStyle(color: Colors.amber),
                  )
                ],
              ),
              SizedBox(
                height: Appconstants.height(context) * 0.17,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3.0),
                          child: Container(
                            height: Appconstants.height(context) * 0.11,
                            width: Appconstants.width(context) * 0.19,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(50),
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/bread.png'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 20,
                          child: const Text(
                            'Bread&',overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 13),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
