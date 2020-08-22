import 'package:flutter/material.dart';

class MenuDashboard extends StatefulWidget {
  @override
  _MenuDashboardState createState() => _MenuDashboardState();
}

final Color backgroundColor = Color(0xff343442);
final TextStyle menuFontStyle = TextStyle(color: Colors.white, fontSize: 20);

class _MenuDashboardState extends State<MenuDashboard> {
  double _deviceHeight, _deviceWidth;
  bool menuIsOpen = false;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

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
    return AnimatedPositioned(
      top: menuIsOpen ? _deviceHeight * 0.1 : 0,
      bottom: menuIsOpen ? _deviceHeight * 0.1 : 0,
      left: menuIsOpen ? _deviceWidth * 0.5 : 0,
      right: menuIsOpen ? -_deviceWidth * 0.5 : 0,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
      child: Material(
        elevation: 8,
        borderRadius: menuIsOpen ? BorderRadius.circular(24.0) : null,
        color: backgroundColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () => setState(() => menuIsOpen = !menuIsOpen),
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
      ),
    );
  }
}
