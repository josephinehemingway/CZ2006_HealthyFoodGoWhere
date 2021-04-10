import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/boundary/widgets/animation.dart';
import '../../widgets/customAppBar.dart';
import '../Home/HomeUI.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/animation.dart';
import '../../widgets/customIcons.dart';
import 'package:flutter_app/control/Authenticator.dart';
import '../../widgets/ProfileWidgets/ProfileMenu.dart';
import '../../widgets/ProfileWidgets/ProfilePic.dart';

/// This is the boundary class which displays the Profile Screen in the mobile UI.
class ProfileUI extends StatefulWidget {

  /// The route name for navigation to [ProfileUI].
  static String routeName = '/profile';

  @override
  _ProfileUIState createState() => _ProfileUIState();
}

/// This class manages the state of the [ProfileUI].
///
/// Includes the widget build for the [ProfileUI].
class _ProfileUIState extends State<ProfileUI> {

  /// Widget Build method to implement [ProfileUI].
  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset: false,
    appBar: myAppBar('Profile', context, HomeUI()),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),

        child: Column(
          children: [
            FadeAnimation(1,ProfilePic()),
            SizedBox(height: 20),

            FadeAnimation(1,Text(getProfileName(), style: TextStyle( //name
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),)),
            SizedBox(height: 2),

            FadeAnimation(1,Text(getEmail(), style: TextStyle( //email
              fontSize: 18,
            ),)),
            SizedBox(height: 20),

            FadeAnimation(1,ProfileMenu(
              text: "My Dietary Preferences",
              icon: Icon(MyFlutterApp.cutlery),
              press: () => {
                Navigator.pushNamed(context, '/editPref')
              },
            )),

            FadeAnimation(1,ProfileMenu(
              text: "Log Out",
              icon: Icon(Icons.logout),
              press: () => {
                signOutGoogle(),
                Navigator.pop(context),
                Navigator.pushNamed(context, '/login')
              },
            )),
            SizedBox(height: 90),
            FadeAnimation(1,Text("Need help?", style: TextStyle( //name
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),)),
            SizedBox(height: 5),
            FadeAnimation(1,Text("Contact us at help@HealthyFoodGoWhere.com", style: TextStyle( //name
                fontSize: 14
            ),)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.profile));


}
