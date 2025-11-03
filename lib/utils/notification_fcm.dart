import '../../../modules/notification/logic/notification_count/notification_count_cubit.dart';
import '../utils/debug/echo.dart';
import '../utils/routes/navigation_services.dart';
import '../widgets/app_snackbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsFCM {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationsFCM() {
    configLocalNotification();
    registerNotification();
    _createNotificationChannel("Aon_portal", "Aon", "Aon");
  }

  registerNotification() async {
    kEcho('FCM registerNotification');
    await firebaseMessaging.requestPermission();
    listenNotification();
    subscribeToTopic();
    getFcmToken();
  }

  listenNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      message.data.forEach((key, value) {
        kEcho('fcm message $key -> $value');
      });
      RemoteNotification notification = message.notification!;
      Map<String, dynamic> data = message.data;
      // AndroidNotification android = message.notification!.android!;

      showNotification('${notification.title}', '${notification.body}', data);
    });
  }

  subscribeToTopic() {
    String topic = 'Aon_portal';
    firebaseMessaging.subscribeToTopic(topic);
  }

  unsubscribeFromTopic() {
    String topic = 'Aon_portal';
    firebaseMessaging.unsubscribeFromTopic(topic);
  }

  Future<String?> getFcmToken() async {
    String? token = await firebaseMessaging.getToken();
    return token;
  }

  // void _handleMessage(RemoteMessage message) {
  //   kEcho('_handleMessage');
  //   String? navigator = message.data['navigator'];
  //   String? id = message.data['id'];
  //   if (navigator == 'product' && id != null) {
  //     try {
  //       int idAsInt = int.parse(id);
  //       ProductModel productModel = ProductModel(productId: idAsInt, price: 0);

  //       Get.toNamed(
  //         Routes.PRODUCT,
  //         arguments: productModel,
  //         parameters: {"wholesalerId": '1'},
  //       );
  //     } catch (e) {
  //       if (kDebugMode) showSnackBar(title: Strings().notification, message: '$e');
  //     }
  //   }
  // }

  void configLocalNotification() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        selectNotification(notificationResponse.payload);
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  Future<void> _createNotificationChannel(
      String id, String name, String description) async {
    kEcho('create channel');
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var androidNotificationChannel = AndroidNotificationChannel(id, name);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
  }

  void showNotification(
      String title, String message, Map<String, dynamic> payLoad) async {
    kEcho('FCM showNotification message $message');
    kEcho('FCM showNotification payLoad $payLoad');
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'Aon_portal',
      'Aon',
      playSound: true,
      enableVibration: false,
      importance: Importance.max,
      priority: Priority.high,
    );

    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    try {
      kEcho('FCM showNotification show');
      await flutterLocalNotificationsPlugin.show(
        1,
        title,
        message,
        platformChannelSpecifics,
        payload: payLoad.toString(),
      );
      if (AppNavigation.navigationKey.currentContext != null) {
        AppSnackbar.notification(
            context: AppNavigation.navigationKey.currentContext!,
            message: message);
      }
      if (AppNavigation.navigationKey.currentContext != null) {
        if (AppNavigation.navigationKey.currentContext!.mounted) {
          AppNavigation.navigationKey.currentContext!
              .read<NotificationCountCubit>()
              .increaseNotificationCount();
        }
      }
    } catch (e) {
      kEcho('FCM showNotification error $e');
    }

    kEcho('FCM showNotification end');
  }

  void selectNotification(String? payload) async {
    kEcho100('fcm selectNotification $payload');
    // if (payload != null) handleNotificationClick(payload);
    AppSnackbar.show(
        context: AppNavigation.navigationKey.currentContext!,
        message: payload!);
  }
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  if (notificationResponse.payload != null) {
    handleNotificationClick(notificationResponse.payload);
  }
}

void handleNotificationClick(String? payload) {}
