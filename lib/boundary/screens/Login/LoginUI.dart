import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/boundary/widgets/animation.dart';
import 'package:flutter_app/boundary/widgets/LoginWidgets/googleSignInButton.dart';

/// This is the boundary class which displays the Login Page in the mobile UI.
class LoginUI extends StatelessWidget {

  /// The route name for navigation to [LoginUI].
  static String routeName = '/login';

  /// Widget Build method to implement [LoginUI].
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FadeAnimation(1, Container(
                          height: MediaQuery.of(context).size.width *0.5,
                          width: MediaQuery.of(context).size.width *0.65,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/loginui.png'),
                                  fit: BoxFit.fill
                              )
                          ),
                        )),
                        SizedBox(height: MediaQuery.of(context).size.height *0.02),

                        FadeAnimation(1,
                            Text("h e a l t h y  g o  w h e r e", style: TextStyle(
                                fontSize: 25,
                                color: Colors.grey[700],
                                fontFamily: 'GlacialIndifference'
                            ),)),

                        SizedBox(height: 7,),

                        FadeAnimation(
                            1, Text("healthy food everywhere", style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontFamily: 'GlacialIndifference'
                        ),)),
                        SizedBox(height: 20,),

                        FadeAnimation(1.5, GoogleSignInButton()),

                        SizedBox(height: MediaQuery.of(context).size.height * 0.05, ),
                        FadeAnimation(1, Container(
                          margin: EdgeInsets.only(top: 3),
                          height: 200,
                          width: 500,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/loginbottom.png'),
                                fit: BoxFit.fill,
                                alignment: Alignment.bottomCenter,
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
        )
    );
  }

}