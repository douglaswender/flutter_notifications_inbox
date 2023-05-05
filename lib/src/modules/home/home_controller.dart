import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  @observable
  int unreadNotifications = 0;

  @action
  Future<void> getUnreadNotifications() async {
    final firestore = FirebaseFirestore.instance;

    final docs = await firestore
        .collection('notifications')
        .where('userId', isEqualTo: '123456')
        .where('read', isEqualTo: false)
        .get()
      ..docs;

    unreadNotifications = docs.docs.length;

    print(unreadNotifications);
  }
}
