import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_notifications_inbox/src/modules/home/home_controller.dart';
import 'package:flutter_notifications_inbox/src/modules/inbox/inbox_module.dart';
import './modules/home/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ModuleRoute('/inbox/', module: InboxModule())
      ];
}
