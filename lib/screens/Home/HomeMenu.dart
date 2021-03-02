import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.NextPg,
    @required this.customIcon,
    this.press,
  }) : super(key: key);

  final String title, subtitle;
  final Widget NextPg;
  final Icon customIcon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        child: MaterialButton(
            minWidth: 200,
            height: 80,
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => (NextPg)));
            },
            color: Colors.teal[200],
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(width: 8),
                customIcon,
                SizedBox(width: 20),
                Column(children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Colors.white)),
                  SizedBox(
                    height: 3,
                  ),
                  Text(subtitle,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.grey[700]))
                ]),
                SizedBox(width: 20),
                customIcon,
              ],
            )));
  }
}
