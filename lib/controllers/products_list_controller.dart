import 'package:get/get.dart';

import '../modals/product_modal.dart';
import 'db_helper.dart';

class ProductListController extends GetxController {
  RxList<ProductDB> products = <ProductDB>[].obs;
  RxList<bool> favouriteProduct = <bool>[].obs;
  RxList<int> favouriteIndex = <int>[].obs;
  RxList<ProductDB> favouriteProductList = <ProductDB>[].obs;

  setProductList() async {
    List<ProductDB> res = await ProductDBHelper.productDBHelper.fetchAllData();

    for (ProductDB e in res) {
      products.assignAll(res);
      favouriteProduct.add((e.isLike == false) ? false : true);

      if (e.isLike) {
        favouriteProductList.add(e);
      }
    }
  }

  addToFavourite(
      {required int index, required ProductDB product, required int i}) async {
    int indexOfProduct = products.indexOf(product);

    products[indexOfProduct].isLike = !products[indexOfProduct].isLike;

    if (products[indexOfProduct].isLike == false) {
      // await ProductDBHelper.productDBHelper
      //     .updateFavourite(id: products[indexOfProduct].id, isLike: "false");
      // favouriteIndex.add(index);
      favouriteIndex.add(indexOfProduct);
      favouriteProductList.add(product);
    } else {
      // await ProductDBHelper.productDBHelper
      //     .updateFavourite(id: products[indexOfProduct].id, isLike: "true");
      // favouriteIndex.remove(index);
      favouriteIndex.remove(indexOfProduct);
      favouriteProductList.remove(product);
    }

    update();
  }

  addToCart({required ProductDB product}) {
    int indexOfProduct = products.indexOf(product);
    products[indexOfProduct].quantity++;
  }

  removeToCart({required ProductDB product}) {
    int indexOfProduct = products.indexOf(product);

    if (products[indexOfProduct].quantity > 0) {
      products[indexOfProduct].quantity--;
    }
  }

  get totalCartProduct {
    int total = 0;
    for (ProductDB e in products) {
      total += e.quantity;
    }
    return total;
  }

  get totalPrice {
    int total = 0;
    for (ProductDB e in products) {
      if (e.quantity > 0) {
        total = total + (e.quantity * e.price);
      }
    }
    return total;
  }
}
