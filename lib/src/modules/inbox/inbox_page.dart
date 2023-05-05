// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import './inbox_controller.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({
    Key? key,
  }) : super(key: key);

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final InboxController controller = Modular.get();

  @override
  void initState() {
    controller.getUserNotifications().then((value) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InboxPage'),
      ),
      body: Container(
        child: controller.loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.notifications!.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    controller.notifications![index].title,
                  ),
                  subtitle: Text(
                    controller.notifications![index].body,
                  ),
                ),
              ),
      ),
    );
  }
}
