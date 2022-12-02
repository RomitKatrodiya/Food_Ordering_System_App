class Product {
  String name;
  int price;
  String image;
  int quantity;
  String isLike;
  String category;

  Product(
      {required this.name,
      required this.price,
      required this.image,
      required this.quantity,
      required this.isLike,
      required this.category});

  factory Product.fromMap({required Map data}) {
    return Product(
        name: data["name"],
        price: data["price"],
        image: data["image"],
        quantity: data["quantity"],
        isLike: data["isLike"],
        category: data["category"]);
  }
}

class ProductDB {
  int id;
  String name;
  int price;
  String image;
  int quantity;
  bool isLike;
  String category;

  ProductDB(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.quantity,
      required this.isLike,
      required this.category});

  factory ProductDB.fromMap({required Map data}) {
    return ProductDB(
        id: data["id"],
        name: data["name"],
        price: data["price"],
        image: data["image"],
        quantity: data["quantity"],
        isLike: data["isLike"] == "false" ? false : true,
        category: data["category"]);
  }
}
