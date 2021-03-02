import 'package:flutter/material.dart';
import '../../animation.dart';
import '../Home/HomePage.dart';

//Login Body
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FadeAnimation_Y(1, Container(
                      //height: MediaQuery.of(context).size.height / 3,
                      margin: EdgeInsets.only(top: 182, left: 10),
                      height: 200,
                      width: 270,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/loginui.png'),
                              fit: BoxFit.fill
                          )
                      ),
                    )),

                    FadeAnimation_Y(1,
                        Text("h e a l t h y  g o  w h e r e", style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey[700],
                            fontFamily: 'GlacialIndifference'
                          //fontWeight: FontWeight.bold
                        ),)),

                    SizedBox(height: 7,),

                    FadeAnimation_Y(
                        1, Text("healthy food everywhere", style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontFamily: 'GlacialIndifference'
                      //fontWeight: FontWeight.bold
                    ),)),
                    SizedBox(height: 20,),

                    FadeAnimation_Y(1.5, MaterialButton(
                      minWidth: 230,
                      height: 60,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => HomePage()));
                      },
                      color: Colors.teal[200],
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text("Login via Gmail", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'GlacialIndifference'
                      ),),
                    )),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("  "),
                      ],),

                    FadeAnimation_Y(1.5, Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account? "),
                        Text("Sign up", style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18
                        ),),
                      ],
                    )),

                    FadeAnimation_Y(1, Container(
                      //height: MediaQuery.of(context).size.height / 3,
                      margin: EdgeInsets.only(top: 3),
                      height: 200,
                      width: 500,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/loginbottom.png'),
                              fit: BoxFit.fill
                          )
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}