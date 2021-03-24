import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/screens/Recipe/RecipeCard.dart';
import 'package:flutter_app/screens/Recipe/Recipe.dart';
import '../../widgets/customAppBar.dart';
import '../Home/HomePage.dart';
import '../../widgets/bottomNavBar.dart';
import '../../animation.dart';
import '../../widgets/my_flutter_app_icons.dart';
import 'package:flutter_app/services/api_services.dart';
import 'package:percent_indicator/percent_indicator.dart';


class HealthyRecipes extends StatefulWidget {
  static String routeName = '/recipeList';
  @override
  _HealthyRecipesState createState() => _HealthyRecipesState();
}

class _HealthyRecipesState extends State<HealthyRecipes> with SingleTickerProviderStateMixin {

  Future<List<Recipe>> recipe_Data = ApiService.instance.getListOfRecipe(6);

  List<Widget> recipeData2 = [];

  List<Widget> recipeData = [
    RecipeCard(
      title: 'Avocado Toast',
      imageUrl: "https://cookieandkate.com/images/2012/04/avocado-toast-with-tomatoes-balsamic-vinegar-basil.jpg",
      calories: '299 kCal',
      duration: 25,
    ),

    RecipeCard(
      title: 'French Toast',
      imageUrl: "https://d1e3z2jco40k3v.cloudfront.net/-/media/mccormick-us/recipes/mccormick/q/2000/quick_and_easy_french_toast_new_2000x1125.jpg?rev=9b2607d0dece40daa4b102d5d07a1880&vd=20200628T070902Z&hash=C5615934E26A451872F4DC1C9E10718A",
      calories: '311 kCal',
      duration: 25,
    ),

    RecipeCard(
      title: 'Kaya Toast',
      imageUrl: "https://4scoin37ye-flywheel.netdna-ssl.com/wp-content/uploads/2010/10/DSC_0510.jpg",
      calories: '319 kCal',
      duration: 25,
    ),
  ];

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


  // nested() {
  //   return NestedScrollView(
  //     controller: _scrollController,
  //     headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
  //       return <Widget>[
  //         collapsibleAppBar('Healthy Recipes',
  //             'These healthy recipes are tailored to your preferences and will help you achieve your goal!',
  //             context, HomePage(),
  //             'images/appbar_recipe.png'),
  //       ];
  //     },
  //     body: Container(
  //       child: ListView.builder(
  //         itemCount: recipeData.length,
  //         physics: BouncingScrollPhysics(),
  //         itemBuilder: (context, index){
  //           return FadeAnimation_Y(0.1, recipeData[index]);
  //         },
  //         padding:EdgeInsets.symmetric(horizontal: 10),
  //       ),
  //     ),
  //   );
  // }

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
        child: FutureBuilder<Recipe>(
          future: ApiService.instance.getRecipe(7777),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final recipe = snapshot.data;
              var title =  recipe.title;
              var id = recipe.id;
              var url = recipe.image;
              var duration = recipe.readyInMinutes;

              recipeData.add(RecipeCard(
                imageUrl: url,
                title: title,
                duration: duration,
                calories: '188kCal',));

              return ListView.builder(
                itemCount: recipeData.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index){
                  return FadeAnimation_Y(0.1, recipeData[index]);
                },
                padding:EdgeInsets.symmetric(horizontal: 10),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 5.0,
              percent: 1.0,
              center: new Text("100%"),
              progressColor: Colors.teal,
            );
          },
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
