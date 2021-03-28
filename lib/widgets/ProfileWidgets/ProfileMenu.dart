import 'package:flutter/material.dart';
import 'package:flutter_app/CurrentUser.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final Widget icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(MediaQuery
            .of(context)
            .size
            .width *0.07,),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        // color: Color(0xFFF5F6F9),
        color: Colors.teal[100],
        onPressed: press,
        child: Row(
          children: [ icon,
            SizedBox(width: 20),
            Expanded(child: Text(text, style: TextStyle(fontSize: 20))),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

Padding saveButton(context, List newlist, CurrentUser curUser){
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: FlatButton(
      padding: EdgeInsets.only(bottom: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      // color: Color(0xFFF5F6F9),
      color: Colors.teal[100],
      onPressed: (){
        // curUser.setDietPref(newlist);
        // curUser.printCurrentUser();
      },
      child: Text('Save', style: TextStyle(fontSize: 20))
  ));
}

