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

AppBar AppBarwithImage(String title, context, Widget prevPg, String image){
  return AppBar(
    centerTitle: true,
    flexibleSpace: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        child:(Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill
              )
          ),
        ))),
    backgroundColor: Colors.grey,
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
    ),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => (prevPg)));
      },
      icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white,),
    ),

    title: Text(title, style: TextStyle(fontSize: 22, color: Colors.white)),

    actions: <Widget>[
      IconButton(icon: Icon(Icons.filter_alt, size: 22, color: Colors.white,),
          onPressed: (){
            // Navigator.pop(context);
          }
      ),
    ],
  );
}

SliverAppBar collapsibleAppBar(String title, String subtitle, context, Widget prevPg, String image){
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
    expandedHeight: 180.0,
    floating: false,
    pinned: true,

    actions: <Widget>[
      IconButton(icon: Icon(Icons.filter_alt, size: 22, color: Colors.white,),
          onPressed: (){
            // Navigator.pop(context);
          }
      ),
    ],

    flexibleSpace: FlexibleSpaceBar(
      background: AppBarContents(subtitle: subtitle, image: image),
      centerTitle: true,
    ),
  );
}

class AppBarContents extends StatelessWidget {
  const AppBarContents({
    Key key,
    @required this.subtitle,
    @required this.image

  }) : super(key: key);

  final String subtitle, image;
  final double appBarHeight = 66.0;


  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
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
                  padding: const EdgeInsets.only(bottom:38.0, left: 35, right: 35),
                  child:new Text(subtitle, textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.white)))
                  )],
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
}

//special app bar for recipe page
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
    expandedHeight: 180.0,
    floating: false,
    pinned: true,

    actions: <Widget>[
      IconButton(icon: Icon(Icons.filter_alt, size: 22, color: Colors.white,),
          onPressed: (){
            // Navigator.pop(context);
          }
      ),
    ],

    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      title: Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
      background: Image.asset(image, fit: BoxFit.cover),
    ),
  );
}

