import 'package:flutter_modular/flutter_modular.dart';
import './inbox_controller.dart';
import './inbox_page.dart';

class InboxModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => InboxController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => InboxPage()),
  ];
}
