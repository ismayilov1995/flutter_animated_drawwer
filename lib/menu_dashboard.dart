import 'package:flutter/material.dart';

class MenuDashboard extends StatefulWidget {
  @override
  _MenuDashboardState createState() => _MenuDashboardState();
}

final Color backgroundColor = Color(0xff343442);
final TextStyle menuFontStyle = TextStyle(color: Colors.white, fontSize: 20);

class _MenuDashboardState extends State<MenuDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [createMenu(context), createDashboard(context)],
        ),
      ),
    );
  }

  Widget createMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dashboard",
              style: menuFontStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Messages",
              style: menuFontStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Utility Bills",
              style: menuFontStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Funds",
              style: menuFontStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Contact",
              style: menuFontStyle,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget createDashboard(BuildContext context) {
    return Material(
      elevation: 4,
      color: backgroundColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.menu),
                color: Colors.white,
                onPressed: () {},
              ),
              Text(
                "My Cards",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              IconButton(
                icon: Icon(Icons.add_circle_outline),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
          Container()
        ],
      ),
    );
  }
}
