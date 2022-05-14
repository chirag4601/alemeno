import 'package:alemeno/screens/good_job_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class Controller extends GetxController {
  void sendNotification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'alemeno',
          title: 'Good Job',
          body: 'Thank you for sharing food with me!!'),
    );

    AwesomeNotifications().actionStream.listen((event) {
      Get.to(const GoodJobScreen());
    });
  }
}