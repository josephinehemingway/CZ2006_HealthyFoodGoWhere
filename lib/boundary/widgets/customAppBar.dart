import 'dart:ui';

import 'package:flutter/material.dart';

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

SliverAppBar eateryAppBar(String title, String subtitle, context, Widget prevPg, Widget nextPg, String image, String subsubtitle){
  return SliverAppBar(
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
      background: AppBarContents(subtitle: subtitle, image: image, subsubtitle: subsubtitle,),
      centerTitle: true,
    ),
  );
}

SliverAppBar recipeListAppBar(String title, String subtitle, context, Widget prevPg, String image){
  return SliverAppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => (prevPg)));
      },
      icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white,),
    ),

    elevation: 0,
    backgroundColor: Colors.teal[200],
    title: Text(title, style: TextStyle(fontSize: 24, color: Colors.white)),
    centerTitle: true,
    expandedHeight: 190.0,
    floating: false,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      background: AppBarContents(subtitle: subtitle, image: image,),
      centerTitle: true,
    ),
  );
}

class AppBarContents extends StatelessWidget {
  const AppBarContents({
    Key key,
    @required this.subtitle,
    @required this.image,
    this.subsubtitle,

  }) : super(key: key);

  final String subtitle, image, subsubtitle;
  final double appBarHeight = 66.0;


  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
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

SliverAppBar RecipeAppBar(String title, context, Widget prevPg, String image){
  return SliverAppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => (prevPg)));
      },
      icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white,),
    ),

    elevation: 0,
    backgroundColor: Colors.teal[200],
    expandedHeight: 190.0,
    floating: false,
    pinned: true,

    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      title: Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
      background: Image.network(image, fit: BoxFit.cover, colorBlendMode: BlendMode.darken,),
    ),
  );
}

