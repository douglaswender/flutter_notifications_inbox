import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_notifications_inbox/src/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Modular.get();
  Map<String, dynamic> options = {};
  final userId = '123456';
  @override
  void initState() {
    fetchOptions();
    controller.getUnreadNotifications().then((value) => setState(
          () => {},
        ));
    super.initState();
  }

  fetchOptions() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 1),
      minimumFetchInterval: const Duration(seconds: 10),
    ));
    remoteConfig.fetchAndActivate();
    options =
        jsonDecode(FirebaseRemoteConfig.instance.getValue('config').asString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Modular.to.pushNamed('/inbox/');
                },
                icon: const Icon(Icons.message),
              ),
              if (controller.unreadNotifications != 0)
                SizedBox(
                  height: 16,
                  width: 16,
                  child: CircleAvatar(
                    child: Text(controller.unreadNotifications.toString()),
                  ),
                )
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (options['push_notification'] ?? false)
              FilledButton(
                onPressed: () {
                  print('');
                },
                child: Text('Enviar notificação'),
              ),
            if (options['sms'] ?? false)
              FilledButton(
                onPressed: () {
                  print('');
                },
                child: Text('Enviar SMS'),
              ),
            if (options['email'] ?? false)
              FilledButton(
                onPressed: () {
                  print('');
                },
                child: Text('Enviar email'),
              ),
            if (options['phone'] ?? false)
              FilledButton(
                onPressed: () {
                  print('');
                },
                child: Text('Enviar ligação'),
              ),
          ],
        ),
      ),
    );
  }
}
