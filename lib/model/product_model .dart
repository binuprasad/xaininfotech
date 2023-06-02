// class Product {
//   final String id;
//   final String name;
//   final String categoryId;
//   final String image;
//   final int price;

//   Product({required this.image,required this.price, required this.id, required this.name, required this.categoryId});
// }
class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}