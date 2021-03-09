import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/screens/Recipe/RecipeCard.dart';
import '../../widgets/customAppBar.dart';
import '../Home/HomePage.dart';
import '../../widgets/bottomNavBar.dart';
import '../../animation.dart';
import '../../widgets/my_flutter_app_icons.dart';

class HealthyRecipes extends StatefulWidget {
  static String routeName = '/recipeList';
  @override
  _HealthyRecipesState createState() => _HealthyRecipesState();
}

class _HealthyRecipesState extends State<HealthyRecipes> with SingleTickerProviderStateMixin {
  List<Widget> recipeData = [];
  ScrollController _scrollController;
  TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: recipeData.length, vsync: this);
    _tabController.addListener(_smoothScrollToTop);
  }

  _smoothScrollToTop() {
    if (_scrollController.hasClients)
      _scrollController.animateTo(
        0,
        duration: Duration(microseconds: 300),
        curve: Curves.ease,
      );
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }


  nested() {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          collapsibleAppBar('Healthy Recipes',
              'These healthy recipes are tailored to your preferences and will help you achieve your goal!',
              context, HomePage(),
              'images/appbar_recipe.png'),
        ];
      },
      body: Container(
        child: ListView.builder(
          itemCount: 5, //recipeData.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index){
            return FadeAnimation_Y(0.1, RecipeCard());
          },
          padding:EdgeInsets.symmetric(horizontal: 10),
        ),
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
