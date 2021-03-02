import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../theme.dart';
import '../Home/HomePage.dart';
import '../../widgets/bottomNavBar.dart';
import '../../animation.dart';
import '../../widgets/my_flutter_app_icons.dart';

class HealthyRecipes extends StatefulWidget {
  static String routeName = '/recipe';
  @override
  _HealthyRecipesState createState() => _HealthyRecipesState();
}

class _HealthyRecipesState extends State<HealthyRecipes> {

  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarwithIcon('Healthy Recipes', context, HomePage(),
          Icon(MyFlutterApp.chefhat, size: 20, color: Colors.black)),

      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.recipe)

  );
}
