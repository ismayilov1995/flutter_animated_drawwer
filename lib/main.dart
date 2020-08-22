import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'menu_dashboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Animation Drawer",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MenuDashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
