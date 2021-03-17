import 'package:get/get.dart';
import 'package:todo_app/screens/home_page.dart';

class Routers {
  static final route = [
    GetPage(name: '/', page: () => HomePage()),
  ];
}
