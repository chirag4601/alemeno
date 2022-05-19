import 'package:alemeno/controller/notification_controller.dart';
import 'package:alemeno/screens/good_job_screen.dart';
import 'package:alemeno/widgets/back_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';

class ClickPictureScreen extends StatefulWidget {
  const ClickPictureScreen({Key? key}) : super(key: key);

  @override
  _ClickPictureScreenState createState() => _ClickPictureScreenState();
}

class _ClickPictureScreenState extends State<ClickPictureScreen> with SingleTickerProviderStateMixin{
  File? image;
  Controller controller = Get.find<Controller>();

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(image!.path);
    var firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    firebaseStorageRef.putFile(image!);
  }
  GifController? gifController;

  @override
  void initState() {
    super.initState();
    gifController = GifController( vsync: this);
  }
  double animationValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              const GoBackButton(),
              // SizedBox(
              //   height: 130,
              //   child: Image.asset("assets/animal.jpg"),
              // ),
              GifImage(
                controller: gifController!,
                image: const NetworkImage("https://firebasestorage.googleapis.com/v0/b/alemeno-7c797.appspot.com/o/animals%2Fdinosaur3_baby_normal_idle.gif?alt=media&token=9c997037-4b81-4ed0-9283-20c785d76e0b"),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xFFF4F4F4),
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 53,
                    ),
                    image == null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 150,
                                width: 28,
                                child: Image.asset("assets/fork.png"),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              const CircleAvatar(
                                backgroundColor: Color(0xFF404040),
                                radius: 100,
                              ),
                              SizedBox(
                                height: 153,
                                width: 39,
                                child: Image.asset("assets/spoon.png"),
                              ),
                            ],
                          )
                        : CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.brown.shade800,
                            backgroundImage: FileImage(
                              image!,
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    image == null
                        ? const Text(
                            "Click your meal",
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xFF3C3C3C),
                            ),
                          )
                        : const Text(
                            "Will you eat this?",
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xFF3C3C3C),
                            ),
                          ),
                    const SizedBox(
                      height: 11,
                    ),
                    image == null
                        ? TextButton(
                            onPressed: () async {
                              // var temp = await ImagePicker()
                              //     .pickImage(source: ImageSource.camera);
                              // if (temp != null) {
                              //   setState(() {
                              //     image = File(temp.path);
                              //   });
                              // }
                              if (gifController!.isAnimating){
                                animationValue = gifController!.duration.inSeconds.toDouble();
                                gifController!.stop(canceled: false);
                              }
                              else{
                                gifController!.animateTo(animationValue);
                              }
                            },
                            child: const CircleAvatar(
                              radius: 64 / 2,
                              backgroundColor: Color(0xFF3E8B3A),
                              child: Icon(
                                Icons.camera_alt,
                                size: 26,
                                color: Color(0xFFF1F1F2),
                              ),
                            ),
                          )
                        : TextButton(
                            onPressed: () {
                              uploadImageToFirebase(context);
                              controller.sendNotification();
                              Get.to(const GoodJobScreen());
                            },
                            child: const CircleAvatar(
                              radius: 64 / 2,
                              backgroundColor: Color(0xFF3E8B3A),
                              child: Icon(
                                Icons.check_sharp,
                                size: 34,
                                color: Color(0xFFF1F1F2),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
