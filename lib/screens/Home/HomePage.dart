import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/main.dart';
import '../Eateries/EateriesListPage.dart';
import '../Profile/Profile.dart';
import '../Recipe/RecipesListPage.dart';
import '../../animation.dart';
import '../../widgets/bottomNavBar.dart';


// resources: https://brainsandbeards.com/blog/bottom-navigation-with-a-list-screen-in-flutter

class HomePage extends StatefulWidget {
  static String routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) => Scaffold(
        // bottomNavigationBar: BottomNavBar(),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,

            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FadeAnimation(1, Container(
                    height: MediaQuery.of(context).size.height / 3,
                    margin: EdgeInsets.only(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/homepage.png'),
                            fit: BoxFit.fill
                        )
                    ),
                  )),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                            children: <Widget>[
                              FadeAnimation(1, Text("Welcome Back!", style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                              ),)),

                              SizedBox(height: 15,),

                              FadeAnimation(1.2, Text("here's to a healthier you!", style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.grey[700]
                              ),)),

                              SizedBox(height: 10,),

                              FadeAnimation(1.2, Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Tune in to our healthy food", style: TextStyle(
                                      fontSize: 15, color: Colors.grey)),
                                  Text("recommendations anytime, anywhere!",style: TextStyle(
                                      fontSize: 15, color: Colors.grey)),
                                ],)),

                              SizedBox(height: 20,),

                              FadeAnimation(1.5,MaterialButton(
                                  minWidth: 300,
                                  height: 70,
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => HealthyEateries()));
                                  },
                                  color: Colors.teal[200],
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                  child: Column(children: <Widget>[
                                    Text("Eating Out?", style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                        color: Colors.white)),

                                    SizedBox(height: 3,),

                                    Text("healthy eateries nearby", style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                        color: Colors.grey[700]))
                                  ])
                              )),

                              SizedBox(height: 10,),

                              FadeAnimation(1.5,MaterialButton(
                                  minWidth: 300,
                                  height: 70,
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => HealthyRecipes()));
                                  },
                                  color: Colors.teal[200],
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                  child: Column(children: <Widget>[
                                    Text("Eating at home?", style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                        color: Colors.white)),

                                    SizedBox(height: 3,),

                                    Text("healthy recipes for you", style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                        color: Colors.grey[700]))
                                  ])
                              )),
                            ]),
                      ],
                    ),
                  )])),
  );

}