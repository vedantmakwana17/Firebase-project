import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_demo/services/notification_service.dart';
// import 'package:firebase_demo/services/push_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:vedant/one.dart';
import 'package:vedant/push_notification/push_notify.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService().init();
  await NotificationService().isAndroidPermissionGranted();
  await NotificationService().requestPermissions();
  await NotificationService().configureDidReceiveLocalNotificationSubject();
  await NotificationService().configureSelectNotificationSubject();
  await PushNotificationService().setupInteractedMessage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("This is a firebase example"),
      ),
    );
  }
}
