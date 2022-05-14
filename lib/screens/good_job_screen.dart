import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoodJobScreen extends StatelessWidget {
  const GoodJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text(
              //   "Counter: ",
              //   style: TextStyle(
              //     fontSize: 24,
              //     color: Colors.black,
              //   ),
              // ),
              const Text(
                "Good Job!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  color: Color(0xFF3E8B3A),
                ),
              ),
              const SizedBox(height: 40,),
              TextButton(
                onPressed: () {
                  Get.back();
                  Get.back();
                },
                child: const CircleAvatar(
                  radius: 45 / 2,
                  backgroundColor: Color(0xFF3E8B3A),
                  child: Icon(
                    Icons.home,
                    size: 26,
                    color: Color(0xFFF1F1F2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
