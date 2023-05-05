// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbox_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InboxController on InboxControllerBase, Store {
  late final _$unreadMessagesAtom =
      Atom(name: 'InboxControllerBase.unreadMessages', context: context);

  @override
  int get unreadMessages {
    _$unreadMessagesAtom.reportRead();
    return super.unreadMessages;
  }

  @override
  set unreadMessages(int value) {
    _$unreadMessagesAtom.reportWrite(value, super.unreadMessages, () {
      super.unreadMessages = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'InboxControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$notificationsAtom =
      Atom(name: 'InboxControllerBase.notifications', context: context);

  @override
  List<NotificationModel>? get notifications {
    _$notificationsAtom.reportRead();
    return super.notifications;
  }

  @override
  set notifications(List<NotificationModel>? value) {
    _$notificationsAtom.reportWrite(value, super.notifications, () {
      super.notifications = value;
    });
  }

  late final _$getUserNotificationsAsyncAction =
      AsyncAction('InboxControllerBase.getUserNotifications', context: context);

  @override
  Future<void> getUserNotifications() {
    return _$getUserNotificationsAsyncAction
        .run(() => super.getUserNotifications());
  }

  @override
  String toString() {
    return '''
unreadMessages: ${unreadMessages},
loading: ${loading},
notifications: ${notifications}
    ''';
  }
}
