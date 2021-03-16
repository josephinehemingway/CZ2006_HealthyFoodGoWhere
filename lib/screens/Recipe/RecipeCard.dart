import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Recipe/RecipeDetailsPage.dart';

class RecipeCard extends StatelessWidget {
  String imageUrl;
  String title;
  String duration;
  String calories;

  RecipeCard({Key key,
    this.imageUrl, //insert url,
    this.title, //insert title
    this.duration, //insert duration
    this.calories //insert calories
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => (RecipeDetailsPage())));
              },
              child: Container(
                height: 210,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                  image: DecorationImage(
                      image: AssetImage(imageUrl),fit: BoxFit.fill),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.black.withOpacity(0.33),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                        child: Center(
                            child: Column(
                                children: [
                                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
                                    maxLines: 3,
                                    overflow: TextOverflow.fade,),
                                  Text(duration, style: TextStyle(fontSize: 16, color: Colors.white)),
                                  Text(calories, style: TextStyle(fontSize: 16, color: Colors.white))])
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )

          ],
        )
    );
  }
}



