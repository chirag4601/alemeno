import 'package:alemeno/controller/notification_controller.dart';
import 'package:get/instance_manager.dart';


class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<Controller>(Controller());
  }
}