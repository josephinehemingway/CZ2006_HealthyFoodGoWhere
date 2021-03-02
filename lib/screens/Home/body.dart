import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/screens/Home/HomeMenu.dart';
import 'package:flutter_app/screens/Profile/ProfilePic.dart';
import 'package:flutter_app/widgets/my_flutter_app_icons.dart';
import '../Eateries/EateriesListPage.dart';
import '../Recipe/RecipesListPage.dart';
import '../../animation.dart';

//Home Body
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: double.infinity,

        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

             Stack(
              overflow: Overflow.visible,
              children: [
                FadeAnimation_Y(1, Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 2.9,
                  margin: EdgeInsets.only(),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/homepage.png'),
                          fit: BoxFit.fill
                      )
                  ))),
                  Positioned(
                    height: 165,
                    width: 165,
                    top: 145,
                    left: 110,
                    child: (FadeAnimation_Y(1,ProfilePic())),
                  ),
              ]),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                        children: <Widget>[
                          SizedBox(height: 20,),
                          FadeAnimation_Y(
                              1, Text("Welcome Back!", style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),)),

                          SizedBox(height: 15,),

                          FadeAnimation_Y(1, Text(
                            "here's to a healthier you!", style: TextStyle(
                              fontSize: 22,
                              color: Colors.grey[700]
                          ),)),

                          SizedBox(height: 10,),

                          FadeAnimation_Y(1, Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Tune in to our healthy food",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey)),
                              Text("recommendations anytime, anywhere!",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey)),
                            ],)),

                          SizedBox(height: 20,),

                          FadeAnimation_Y(1,
                            HomeMenu(
                                title: "Eating Out?",
                                subtitle: "healthy eateries nearby",
                                NextPg: HealthyEateries(),
                                customIcon: Icon(MyFlutterApp.cutlery, color: Colors.white, size: 30))
                          ),
                          SizedBox(height: 10,),

                          FadeAnimation_Y(1, HomeMenu(
                              title: "Eating at home?",
                              subtitle: "healthy recipes for you",
                              NextPg: HealthyRecipes(),
                              customIcon: Icon(MyFlutterApp.chefhat, color: Colors.white))
                          ),
                        ]),
                  ],
                ),
              )
            ])
    );
  }
}