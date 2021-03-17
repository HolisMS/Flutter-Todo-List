import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todo_app/common/routers.dart';
import 'common/style.dart' as style;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: style.StyleUi.primaryColor));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRight,
      title: 'Todo App',
      theme: ThemeData(
          primaryColor: style.StyleUi.primaryColor,
          accentColor: style.StyleUi.accentColor,
          scaffoldBackgroundColor: style.StyleUi.backgroudColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: style.StyleUi.textTheme,
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
            textTheme: style.StyleUi.textTheme.apply(bodyColor: Colors.white),
            elevation: 0,
          )),
      initialRoute: '/',
      getPages: Routers.route,
    );
  }
}
