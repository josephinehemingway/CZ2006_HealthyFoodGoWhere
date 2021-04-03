import 'dart:ui';
import 'package:flutter/material.dart';

/// A simple custom App Bar.
///
/// Used in [ProfileUI] and [filterRadius].
AppBar myAppBar(String title, context, Widget prevPg){
  return AppBar(
    centerTitle: true,
    title: Text(title, style: TextStyle(fontSize: 22, color: Colors.black)),
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => (prevPg)));
      },
      icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
    ),
  );
}

/// A custom sliver app bar that minimises to just the title when user scrolls down the screen.
///
/// Used in [EateryListUI].
/// Consists of an image background, title, subtitle, sub-subtitle and an action button.
SliverAppBar eateryAppBar(String title, String subtitle, context, Widget prevPg, Widget nextPg, String image, String subsubtitle){
  return SliverAppBar(
    stretch: true,
    onStretchTrigger: () {
      // Function callback for stretch
      return Future<void>.value();
    },
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => (prevPg)));
      },
      icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white,),
    ),

    elevation: 0,
    backgroundColor: Colors.teal[200],
    title: Text(title, style: TextStyle(fontSize: 22, color: Colors.white)),
    centerTitle: true,
    expandedHeight: 190.0,
    floating: false,
    pinned: true,

    actions: <Widget>[
      IconButton(icon: Icon(Icons.filter_alt, size: 22, color: Colors.white,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => (nextPg)));
          }
      ),
    ],

    flexibleSpace: FlexibleSpaceBar(
      stretchModes: const <StretchMode>[
        StretchMode.zoomBackground,
        StretchMode.blurBackground,
        StretchMode.fadeTitle,
      ],
      background: AppBarContents(subtitle: subtitle, image: image, subsubtitle: subsubtitle,),
      centerTitle: true,
    ),
  );
}

/// A custom sliver app bar that minimises to just the title when user scrolls down the screen.
///
/// Used in [RecipeListUI].
/// Consists of an image background, title, subtitle and sub-subtitle only.
SliverAppBar recipeListAppBar(String title, String subtitle, context, Widget prevPg, String image){
  return SliverAppBar(
    stretch: true,
    onStretchTrigger: () {
      // Function callback for stretch
      return Future<void>.value();
    },
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => (prevPg)));
      },
      icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white,),
    ),

    elevation: 0,
    backgroundColor: Colors.teal[200],
    title: Text(title, style: TextStyle(fontSize: 22, color: Colors.white)),
    centerTitle: true,
    expandedHeight: 190.0,
    floating: false,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      stretchModes: const <StretchMode>[
        StretchMode.zoomBackground,
        StretchMode.blurBackground,
        StretchMode.fadeTitle,
      ],
      background: AppBarContents(subtitle: subtitle, image: image,),
      centerTitle: true,
    ),
  );
}

/// This is the class that implements the contents of the custom sliver app bars.
///
/// Used in [recipeListAppBar], [eateryAppBar].
class AppBarContents extends StatelessWidget {

  /// Class constructor for [AppBarContents].
  const AppBarContents({
    Key key,
    @required this.subtitle,
    @required this.image,
    this.subsubtitle, // optional parameter
  }) : super(key: key);

  /// Parameters for [AppBarContents]
  final String subtitle, image, subsubtitle;

  /// Height of the app bar.
  final double appBarHeight = 66.0;

  /// Widget Build method for implementation of [AppBarContents].
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    // This 'if' condition is to determine whether the AppBarContents is generated for the
    // Recipe or Eatery sliver app bar.
    //
    // If subsubtitle is null, it is for [recipeListAppBar].
    // If subsubtitle is not null, it is for [eateryAppBar].
    if (subsubtitle != null){
      return Container(
        padding: new EdgeInsets.only(top: statusBarHeight),
        height: statusBarHeight + appBarHeight,
        child: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(child: Padding(
                          padding: const EdgeInsets.only(bottom: 25.0, left: 35, right: 35),
                          child: new Text(subtitle, textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18, color: Colors.white)))
                      ),
                      Text(subsubtitle, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Colors.grey[300])),
                      SizedBox(height: 15,)],
                  )
              )
            ],
          ),

        ),
        decoration: new BoxDecoration(
            image: DecorationImage(
                image: AssetImage(image), fit: BoxFit.cover
            )
        ),
      );
    }
    else{
      return Container(
        padding: new EdgeInsets.only(top: statusBarHeight),
        height: statusBarHeight + appBarHeight,
        child: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(child: Padding(
                          padding: const EdgeInsets.only(bottom: 38.0, left: 35, right: 35),
                          child: new Text(subtitle, textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18, color: Colors.white)))
                      ),
              ])
          ),
          ]
        )),
        decoration: new BoxDecoration(
            image: DecorationImage(
                image: AssetImage(image), fit: BoxFit.cover
            )
        ),
      );
    }
  }
}

/// A custom sliver app bar that minimises to just the title when user scrolls down the screen.
///
/// Used in RecipeDetailsUI.
/// Consists of an image background and title only.
SliverAppBar RecipeAppBar(String title, context, Widget prevPg, String image){
  return SliverAppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => (prevPg)));
      },
      icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white,),
    ),
    stretch: true,
    onStretchTrigger: () {
    // Function callback for stretch
    return Future<void>.value();
    },

    elevation: 0,
    backgroundColor: Colors.teal[200],
    expandedHeight: 190.0,
    floating: false,
    pinned: true,

    flexibleSpace: FlexibleSpaceBar(
        stretchModes: const <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
      centerTitle: true,
      title: Text(title, style: TextStyle(fontSize: 17, color: Colors.white), textAlign: TextAlign.center,),
      background: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(image, fit: BoxFit.cover),
          const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, 0.5),
                  end: Alignment(0.0, 0.0),
                  colors: <Color>[
                    Color(0x60000000),
                    Color(0x00000000),
                  ],
                ),
              ),
          )
        ]
      )
    ),
  );
}

