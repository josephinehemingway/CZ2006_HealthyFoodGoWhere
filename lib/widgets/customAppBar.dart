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

SliverAppBar collapsibleAppBar(String title, context, Widget prevPg, String image){
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
    // title: Text(title, style: TextStyle(fontSize: 22, color: Colors.black)),

    expandedHeight: 200.0,
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

