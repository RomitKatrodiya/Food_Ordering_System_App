import 'package:flutter/material.dart';
import 'package:food_ordering_system/controllers/products_list_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

productContainer({
  required ProductListController productListController,
  required int i,
}) {
  return Stack(
    children: [
      Container(
        margin: EdgeInsets.only(
          right: (i.isOdd) ? 10 : 5,
          left: (i.isEven) ? 10 : 5,
          top: 5,
          bottom: 5,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.12),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              alignment: Alignment.center,
              height: 130,
              productListController.products[i].image,
            ),
            const SizedBox(height: 10),
            Text(
              productListController.products[i].name,
              style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 15),
                Text(
                  "20min",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.star,
                  color: Colors.yellow.shade600,
                  size: 26,
                ),
                const SizedBox(width: 3),
                Text(
                  "4.5",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 15),
                Text(
                  "\$ ${productListController.products[i].price}.00",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    productListController.addToCart(
                        product: productListController.products[i]);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.topRight,
        child: Obx(
          () => IconButton(
            onPressed: () {
              productListController.addToFavourite(
                index: i,
                product: productListController.products[i],
                i: i,
              );
            },
            icon: Icon(
              (productListController.products[i].isLike == false)
                  ? Icons.favorite_outline
                  : Icons.favorite,
              color: (productListController.products[i].isLike == false)
                  ? null
                  : Colors.red,
            ),
          ),
        ),
      )
    ],
  );
}
