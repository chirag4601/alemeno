import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 24,),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const CircleAvatar(
            radius: 45 / 2,
            backgroundColor: Color(0xFF3E8B3A),
            child: Icon(
              Icons.arrow_back,
              size: 26,
              color: Color(0xFFF1F1F2),
            ),
          ),
        ),
      ],
    );
  }
}
