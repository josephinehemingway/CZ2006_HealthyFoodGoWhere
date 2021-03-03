import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../widgets/customAppBar.dart';
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
  nested() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          collapsibleAppBar('Healthy Recipes', context, HomePage(),
              'images/appbar_recipe.png'),
        ];
      },
      body: Center(
        child: Text("hello"),
      ),
    );
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.recipe),
    body: nested(),
    );
}
