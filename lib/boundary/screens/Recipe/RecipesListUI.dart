import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/boundary/widgets/animation.dart';
import 'package:flutter_app/control/Authenticator.dart';
import '../../widgets/RecipeWidgets/RecipeCard.dart';
import 'package:flutter_app/entity/Recipe.dart';
import '../../widgets/customAppBar.dart';
import '../Home/HomeUI.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/animation.dart';
import 'package:flutter_app/control/APIRecipeGenerator.dart';
import 'package:percent_indicator/percent_indicator.dart';

/// This is the boundary class which displays the List of Healthy Recipes in the mobile UI.
class HealthyRecipesList extends StatefulWidget {

  /// The route name for navigation to [HealthyRecipesList].
  static String routeName = '/recipeList';

  @override
  _HealthyRecipesListState createState() => _HealthyRecipesListState();
}

/// This class manages the state of [HealthyRecipesList].
///
/// Includes the business logic behind [HealthyRecipesList].
class _HealthyRecipesListState extends State<HealthyRecipesList> with SingleTickerProviderStateMixin {

  /// The number of recipe cards to be generated on the [HealthyRecipesList] screen.
  static int size = 5;

  /// A list of [RecipeCard] to be displayed.
  List<Widget> recipeData = [
    // Sample Data
    RecipeCard(
    title: 'Avocado Toast',
    imageUrl: "https://cookieandkate.com/images/2012/04/avocado-toast-with-tomatoes-balsamic-vinegar-basil.jpg",
    calories: '[299]',
    duration: 25,
    ),

    RecipeCard(
    title: 'French Toast',
    imageUrl: "https://d1e3z2jco40k3v.cloudfront.net/-/media/mccormick-us/recipes/mccormick/q/2000/quick_and_easy_french_toast_new_2000x1125.jpg?rev=9b2607d0dece40daa4b102d5d07a1880&vd=20200628T070902Z&hash=C5615934E26A451872F4DC1C9E10718A",
    calories: '[311]',
    duration: 30,
    ),
  ];
  
  ScrollController _scrollController;
  TabController _tabController;

  int currentIndex = 0;

  /// Initialising [HealthyRecipesList].
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: recipeData.length, vsync: this);
    _tabController.addListener(_smoothScrollToTop);
  }

  /// Animation for the listview.
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

  /// A custom [NestedScrollView] implementation.
  nested() {
    var userPreferenceList=[];
    return NestedScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          recipeListAppBar('Healthy Recipes',
              'These healthy recipes are tailored to your preferences and will help you lead a healthier lifestyle!',
              context, HomeUI(),
              'images/appbar_recipe.png'),
        ];
      },
        
      body: Container(
        /// To get the user's preference list from the Firebase Realtime Database.
        child: FutureBuilder<DataSnapshot>(
          future: FirebaseDatabase.instance.reference().child('User/${getUserID()}/preferences').once(),
          builder: (context, snapshot) {
            
            // If the database snapshot has data, the [userPreferenceList] is not empty.
            //
            // Else, set an empty list for [userPreferenceList].
            if (snapshot.hasData && snapshot.data.value != null) {
              userPreferenceList = snapshot.data.value;
            }
            else {
              userPreferenceList= [];
            }
            
            // To get the suitable recipe list that is catered to the user's diet preference.
            //
            // While retrieving recipes, load a circular percentage indicator.
            // If there is none, return an error message.
            return FutureBuilder<List<Recipe>>(
              future: APIRecipeGenerator.instance.getListOfRecipe(size,userPreferenceList),
              builder: (context, snapshot) {
            if (snapshot.hasData) {
              final recipelist = snapshot.data;
              for (int i=0; i<size;i++) {
                var title = recipelist[i].title;
                var id = recipelist[i].id;
                var url = recipelist[i].image;
                var duration = recipelist[i].readyInMinutes;
                var summary = recipelist[i].summary;
                var calories = regExp.allMatches(summary).map((z) => z.group(0)).toList().toString();
                
                // Adds each recipe from the API generated recipe list into [recipeData]
                // as a [RecipeCard].
                recipeData.add(RecipeCard(
                  imageUrl: url,
                  title: title,
                  id: id,
                  duration: duration,
                  calories: calories,));
              }
              
              /// A list view to display the list of recipe cards.
              return ListView.builder(
                itemCount: recipeData.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index){
                  return FadeAnimation(0.1, recipeData[index]);
                },
                padding:EdgeInsets.symmetric(horizontal: 10),
              );
              
            } else if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("No recipes found based on your dietary preferences.", textAlign: TextAlign.center, style: TextStyle(fontSize: 24, color: Colors.grey[800]),),
                    SizedBox(height: 20),
                    // Text(snapshot.error.toString(), textAlign: TextAlign.center,),
                    SizedBox(height: 40),
              ]);
            }
  
            /// Returns a circular percentage indicator when loading the list of recipes.
              return CircularPercentIndicator(
                radius: 40.0,
                lineWidth: 4.0,
                percent: 1.0,
                progressColor: Colors.teal,
              );
            });
            }
        ),
          )
      );
  }

  /// Widget build to implement the [HealthyRecipesList].
  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.recipe),
    body: nested(),
    );

  RegExp regExp = new RegExp(
      r'(\d+)(?=\s*calories)'
  );
}
