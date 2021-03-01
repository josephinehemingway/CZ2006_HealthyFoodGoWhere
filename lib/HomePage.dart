import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Eateries.dart';
import 'package:flutter_app/Profile.dart';
import 'package:flutter_app/Recipes.dart';
import 'animation.dart';
import 'package:flutter_app/my_flutter_app_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    HealthyRecipes(),
    HealthyEateries(),
    Profile()
  ];
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,

        // appBar: AppBar(
        //   elevation: 0,
        //   brightness: Brightness.light,
        //   backgroundColor: Colors.white,
        //   leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        //     },
        //     icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        //   ),
        // ),

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
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => HealthyEateries()));
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

      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, // new
          selectedItemColor: Colors.teal[300],
          unselectedItemColor: Colors.grey.withOpacity(.60),
          currentIndex: _currentIndex, // new
          backgroundColor: Colors.black12,
          items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(MyFlutterApp.chefhat),
                title: Text('Recipes'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(MyFlutterApp.cutlery),
                title: Text('Eateries'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile')
            )],
      )
  );

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}