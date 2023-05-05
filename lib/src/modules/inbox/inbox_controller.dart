import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notifications_inbox/src/modules/inbox/notification_model.dart';
import 'package:mobx/mobx.dart';

part 'inbox_controller.g.dart';

class InboxController = InboxControllerBase with _$InboxController;

abstract class InboxControllerBase with Store {
  @observable
  int unreadMessages = 0;

  @observable
  bool loading = true;

  @observable
  List<NotificationModel>? notifications;

  @action
  Future<void> getUserNotifications() async {
    loading = true;
    final firestore = FirebaseFirestore.instance;

    final docs = await firestore
        .collection('notifications')
        .where('userId', isEqualTo: '123456')
        .get()
      ..docs;

    notifications =
        docs.docs.map((e) => NotificationModel.fromMap(e.data())).toList();

    print(notifications);
    loading = false;
  }
}
