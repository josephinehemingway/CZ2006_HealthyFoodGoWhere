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
      alignment: Alignment.center,
        width: 300,
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width *0.75,
            height: MediaQuery.of(context).size.width *0.2,
            onPressed: () {
              // Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => (NextPg)));
            },
            color: Colors.teal[200],
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Align(
                alignment: Alignment.center,
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
                )
            ),));
  }
}
