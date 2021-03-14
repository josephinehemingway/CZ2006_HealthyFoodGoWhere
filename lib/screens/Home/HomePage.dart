import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/screens/Home/body.dart';
import '../../widgets/bottomNavBar.dart';
// resources: https://brainsandbeards.com/blog/bottom-navigation-with-a-list-screen-in-flutter

class HomePage extends StatefulWidget {
  static String routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Body(),
        bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.home),
      );
}
