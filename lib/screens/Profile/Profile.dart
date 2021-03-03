import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../theme.dart';
import '../Home/HomePage.dart';
import 'UI components/body.dart';
import '../../widgets/bottomNavBar.dart';
import '../../animation.dart';
import '../../widgets/my_flutter_app_icons.dart';

class Profile extends StatefulWidget {
  static String routeName = '/profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset: false,
    appBar: myAppBar('Profile', context, HomePage()),
      body: Body(),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.profile));


}
