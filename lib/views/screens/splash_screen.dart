import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.green,
        child: Column(
          children: [
            const Spacer(),
            const SizedBox(height: 30),
            Image.asset("assets/images/food2.png", height: 250),
            const SizedBox(height: 20),
            Text(
              "Fast Delivery at\nyour doorstop",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Home delivery and online reservation\nsystem for restaurant and cafe",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Get.offAndToNamed("/");
              },
              child: Container(
                width: double.infinity,
                height: 70,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Let's Explore",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
