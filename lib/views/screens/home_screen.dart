import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/products_list_controller.dart';
import '../../global/global.dart';
import '../components/product_container.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ProductListController productListController =
      Get.find<ProductListController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Align(
            alignment: Alignment.center,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.green,
              ),
              child: const Icon(Icons.menu),
            ),
          ),
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              const SizedBox(width: 5),
              Text(
                "Surat",
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade600,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          actions: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.green,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://avatars.githubusercontent.com/u/111499361?v=4"),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              expandedHeight: 225.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
                      Text(
                        "Hi Romit",
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Find your food",
                        style: GoogleFonts.poppins(
                          fontSize: 31,
                          color: Colors.black12.withOpacity(0.65),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green.withOpacity(0.15),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Icon(Icons.search,
                                color: Colors.grey, size: 30),
                            const SizedBox(width: 10),
                            Text(
                              "Search Food",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.green,
                              ),
                              child:
                                  const Icon(Icons.sort, color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                titlePadding: EdgeInsets.zero,
                expandedTitleScale: 0001,
                title: Row(
                  children: [
                    const SizedBox(width: 5),
                    TextButton(
                      onPressed: () {},
                      style: textButtonStyle(i: 0),
                      child: const Text("Food"),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: textButtonStyle(i: 1),
                      child: const Text("Fruits"),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: textButtonStyle(i: 2),
                      child: const Text("Grocery"),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: textButtonStyle(i: 3),
                      child: const Text("Vegetables"),
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              return SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                  mainAxisExtent: 300,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int i) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {
                        indexForDetailScreen = i;
                        Get.toNamed("/details_screen");
                      },
                      child: productContainer(
                        productListController: productListController,
                        i: i,
                      ),
                    );
                  },
                  childCount: productListController.products.length,
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  textButtonStyle({required int i}) {
    return TextButton.styleFrom(
      foregroundColor: Colors.green,
      textStyle: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
