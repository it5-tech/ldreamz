//https://github.com/Coding-Orbit/flutter_local_notification/blob/main/lib/screens/home.dart
//https://blog.logrocket.com/understanding-flutter-timer-class-timer-periodic/

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ldreamz/assets/notification/notification.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'dart:async';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() {
  runApp(NotificationPage());
}

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String time = "";
  var reminder = 600;

  @override
  void initState() {
    Timer mytimer = Timer.periodic(Duration(seconds: reminder), (timer) {
      NotificationService.showBigTextNotification(
          title: "Am I dreaming?",
          body: "Am I dreaming?",
          fln: flutterLocalNotificationsPlugin);

      setState(() {});
      //mytimer.cancel() //to terminate this timer
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SizedBox(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Setup Reality \nCheck on every:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var reminder = 5;

                      //mytimer.cancel();

                      Timer mytimer =
                          Timer.periodic(Duration(seconds: reminder), (timer) {
                        NotificationService.showBigTextNotification(
                            title: "5 secondsAm I dreaming?",
                            body: "Am I dreaming? 5 seconds",
                            fln: flutterLocalNotificationsPlugin);

                        setState(() {});
                        //mytimer.cancel() //to terminate this timer
                      });
                    },
                    child: const Text('5 Seconds'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var reminder = 60;

                      Timer mytimer =
                          Timer.periodic(Duration(seconds: reminder), (timer) {
                        NotificationService.showBigTextNotification(
                            title: "1 minute Am I dreaming?",
                            body: "Am I dreaming? 1 minute",
                            fln: flutterLocalNotificationsPlugin);

                        setState(() {});
                        //mytimer.cancel() //to terminate this timer
                      });
                    },
                    child: const Text('1 Minute'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var reminder = 600;

                      Timer mytimer =
                          Timer.periodic(Duration(seconds: reminder), (timer) {
                        NotificationService.showBigTextNotification(
                            title: "10 m Am I dreaming?",
                            body: "Am I dreaming?",
                            fln: flutterLocalNotificationsPlugin);

                        setState(() {});
                        //mytimer.cancel() //to terminate this timer
                      });
                    },
                    child: const Text('10 Minutes'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



/*
void main() {
  runApp(const MyApp());
}

@override
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        var greeting = "After Some time";
      });
    });
    NotificationService.initialize(flutterLocalNotificationsPlugin);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF3ac3cb), Color(0xFFf85187)])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.blue.withOpacity(0.5),
          ),
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              width: 200,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  NotificationService.showBigTextNotification(
                      title: "New message title",
                      body: "Your long body",
                      fln: flutterLocalNotificationsPlugin);
                },
                child: Text("click"),
              ),
            ),
          )),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:ldreamz/assets/notification/local_notification_service.dart';
import 'package:ldreamz/assets/notification/Secondscreen.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();
    listenToNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SizedBox(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await service.showNotification(
                          id: 0,
                          title: 'Notification Title',
                          body: 'Some body');
                    },
                    child: const Text('Show Local Notification'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await service.showScheduledNotification(
                        id: 0,
                        title: 'Notification Title',
                        body: 'Some body',
                        seconds: 4,
                      );
                    },
                    child: const Text('Show Scheduled Notification'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await service.showNotificationWithPayload(
                          id: 0,
                          title: 'Notification Title',
                          body: 'Am i dreaming?',
                          payload: 'payload navigation');
                    },
                    child: const Text('Show Notification With Payload'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNoticationListener);

  void onNoticationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => SecondScreen(payload: payload))));
    }
  }
}
*/
