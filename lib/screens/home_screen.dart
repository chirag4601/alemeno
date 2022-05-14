import 'package:alemeno/screens/click_picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/alemeno.png"),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xFF3E8B3A),
                ),
              ),
              onPressed: () {
                Get.to(const ClickPictureScreen());
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Share Your Meal",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFAFAFA),
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
