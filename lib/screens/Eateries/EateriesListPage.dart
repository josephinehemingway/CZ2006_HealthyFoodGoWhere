import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/screens/Home/HomePage.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/my_flutter_app_icons.dart';

import '../../theme.dart';

class HealthyEateries extends StatefulWidget {
  static String routeName = '/eateries';
  @override
  _HealthyEateriesState createState() => _HealthyEateriesState();
}

class _HealthyEateriesState extends State<HealthyEateries> {

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: Colors.white,

      appBar: AppBarwithIcon('Healthy Eateries', context, HomePage(),
          Icon(MyFlutterApp.cutlery, size: 20, color: Colors.black)),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.eatery)
  );
}
