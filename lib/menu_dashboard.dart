import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuDashboard extends StatefulWidget {
  @override
  _MenuDashboardState createState() => _MenuDashboardState();
}

final Color backgroundColor = Color(0xff343442);
final TextStyle menuFontStyle = TextStyle(color: Colors.white, fontSize: 20);
final Duration _duration = Duration(milliseconds: 300);

class _MenuDashboardState extends State<MenuDashboard>
    with SingleTickerProviderStateMixin {
  double _deviceHeight, _deviceWidth;
  bool menuIsOpen = false;
  AnimationController _animController;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: _duration);
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.7)
        .animate(CurvedAnimation(parent: _animController, curve: Curves.ease));
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

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
      top: 0,
      bottom: 0,
      left: menuIsOpen ? _deviceWidth * 0.5 : 0,
      right: menuIsOpen ? -_deviceWidth * 0.5 : 0,
      duration: _duration,
      curve: Curves.ease,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          elevation: 8,
          borderRadius: menuIsOpen ? BorderRadius.circular(12.0) : null,
          color: backgroundColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        if (menuIsOpen) {
                          _animController.reverse().orCancel;
                        } else {
                          _animController.forward().orCancel;
                        }
                        menuIsOpen = !menuIsOpen;
                      });
                    },
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
              Container(
                height: 200,
                margin: EdgeInsets.only(top: 12.0),
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.indigo),
                      margin: EdgeInsets.symmetric(horizontal: 12.0),
                    ),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.lightBlueAccent),
                      margin: EdgeInsets.symmetric(horizontal: 12.0),
                    ),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.pink),
                      margin: EdgeInsets.symmetric(horizontal: 12.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
