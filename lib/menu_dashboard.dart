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
  Animation<double> _scaleMenuAnimation;
  Animation<Offset> _menuOffsetAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: _duration);
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.7).animate(
        CurvedAnimation(parent: _animController, curve: Curves.easeIn));
    _scaleMenuAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animController, curve: Curves.easeIn));
    _menuOffsetAnimation = Tween(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _animController, curve: Curves.easeIn));
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
    return SlideTransition(
      position: _menuOffsetAnimation,
      child: ScaleTransition(
        scale: _scaleMenuAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.lightBlueAccent,
                    ),
                    label: Text(
                      "Create User",
                      style: menuFontStyle,
                    )),
                FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.sim_card_alert,
                      color: Colors.lightBlueAccent,
                    ),
                    label: Text(
                      "Remove Card",
                      style: menuFontStyle,
                    )),
                FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.credit_card,
                      color: Colors.lightBlueAccent,
                    ),
                    label: Text(
                      "Cards",
                      style: menuFontStyle,
                    )),
                FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: Colors.lightBlueAccent,
                    ),
                    label: Text(
                      "Settings",
                      style: menuFontStyle,
                    )),
                FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.fingerprint,
                      color: Colors.lightBlueAccent,
                    ),
                    label: Text(
                      "Privacy",
                      style: menuFontStyle,
                    )),
              ],
            ),
          ),
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
          child: SingleChildScrollView(
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
                  color: Colors.black26,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
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
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: _singleListTile,
                    itemCount: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _singleListTile(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.black26,
            child: Icon(Icons.portrait),
          ),
          title: Text("List title $index"),
          trailing: Icon(Icons.arrow_right),
        ),
      ),
    );
  }
}
