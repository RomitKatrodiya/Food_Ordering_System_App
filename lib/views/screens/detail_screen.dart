import 'package:flutter/material.dart';
import 'package:food_ordering_system/controllers/products_list_controller.dart';
import 'package:food_ordering_system/global/global.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key);

  ProductListController productListController =
      Get.find<ProductListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          width: 42,
          padding: const EdgeInsets.only(left: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white.withOpacity(0.2),
          ),
          alignment: Alignment.center,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Food Details",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        actions: [
          Obx(
            () => Container(
              margin: const EdgeInsets.all(8),
              width: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.2),
              ),
              child: IconButton(
                onPressed: () {
                  productListController.addToFavourite(
                    index: indexForDetailScreen!,
                    product:
                        productListController.products[indexForDetailScreen!],
                    i: indexForDetailScreen!,
                  );
                },
                icon: Icon(
                  (productListController
                              .products[indexForDetailScreen!].isLike ==
                          false)
                      ? Icons.favorite_outline
                      : Icons.favorite,
                  color: (productListController
                              .products[indexForDetailScreen!].isLike ==
                          false)
                      ? null
                      : Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height / 1.55,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productListController
                                .products[indexForDetailScreen!].name,
                            style: GoogleFonts.poppins(
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "\$ ${productListController.products[indexForDetailScreen!].price}.00",
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                productListController.removeToCart(
                                    product: productListController
                                        .products[indexForDetailScreen!]);
                              },
                              icon:
                                  const Icon(Icons.remove, color: Colors.white),
                            ),
                            Text(
                              "${productListController.products[indexForDetailScreen!].quantity}",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            IconButton(
                              onPressed: () {
                                productListController.addToCart(
                                    product: productListController
                                        .products[indexForDetailScreen!]);
                              },
                              icon: const Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade600,
                        size: 28,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        "4.5",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.water_drop,
                        color: Colors.red,
                        size: 28,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "100 Kcal",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.access_time_filled_rounded,
                        color: Colors.amber,
                        size: 28,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "20min",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "About Food",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Salad with a tangy lemon dressing, onion and tomato. This avocado salad is a simple, delish summer salad. The recipe is vegan and gluten free. Avocado salad is our favorite salad.",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      productListController.addToCart(
                          product: productListController
                              .products[indexForDetailScreen!]);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Add To Cart",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
            child: Image.asset(
              productListController.products[indexForDetailScreen!].image,
            ),
          ),
        ],
      ),
    );
  }
}
