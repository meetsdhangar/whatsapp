import 'package:get/get.dart';
import 'package:whatsapp/Routes/routesname.dart';
import 'package:whatsapp/screens/homeScreen.dart';
import 'package:whatsapp/screens/splashScreen.dart';

class Approutes {
  static appRoutes() => [
        GetPage(name: RoutesName.SplashScreen, page: () => SplashScreen()),
        GetPage(name: RoutesName.HomeScreen, page: () => HomeScreen())
      ];
}
