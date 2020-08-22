import 'package:flutter/material.dart';

import 'menu_dashboard.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter Animation Drawer",
    theme: ThemeData(primarySwatch: Colors.blue),
    home: MenuDashboard(),
    debugShowCheckedModeBanner: false,
  ));
}
