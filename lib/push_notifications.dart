import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

// The background message handler must be a top-level function.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("Handling a background message: ${message.messageId}");
  debugPrint("Title: ${message.notification?.title}");
  debugPrint("Body: ${message.notification?.body}");
  debugPrint("Payload: ${message.data}");
}

class AppNotifications {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> init() async {
    // Request notification permissions
    await _firebaseMessaging.requestPermission();

    // Get Firebase Messaging token
    final userFirebaseIdToken = await _firebaseMessaging.getToken();
    debugPrint("userFirebaseIdToken: $userFirebaseIdToken");

    // Initialize notification handling
    initAllNotificationsMessages();
  }

  Future<void> initAllNotificationsMessages() async {
    // Set foreground notification presentation options
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Handle notification when the app is opened from a terminated state
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // Handle notification when the app is opened while running in the background
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    // Register the background message handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  // Handle the message for foreground/background state
  void handleMessage(RemoteMessage? message) {
    if (message != null) {
      debugPrint("Title: ${message.notification?.title}");
      debugPrint("Body: ${message.notification?.body}");
      debugPrint("Payload: ${message.data}");
    }
  }
}
