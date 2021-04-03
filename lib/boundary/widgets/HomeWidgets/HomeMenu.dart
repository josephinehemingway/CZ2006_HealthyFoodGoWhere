import 'package:flutter/material.dart';

/// This is the boundary class for displaying a reusable menu button widget.
///
/// Used in [HomeUI].
class HomeMenu extends StatelessWidget {

  /// Class constructor for [HomeMenu].
  const HomeMenu({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.NextPg,
    @required this.customIcon,
    this.press,
  }) : super(key: key);

  /// Parameters for [HomeMenu]
  ///
  /// ['title'] is the title of the button.
  /// ['subtitle'] is the subtitle of the button.
  final String title, subtitle;

  /// Parameter for [HomeMenu]
  ///
  /// To specify the next page to navigate to when the button is clicked.
  final Widget NextPg;

  /// Parameter for [HomeMenu]
  ///
  /// The icon to be displayed on the button.
  final Icon customIcon;

  /// Parameter for [HomeMenu]
  ///
  /// Logic that will be carried out when the button is pressed.
  final VoidCallback press;

  /// Widget build method to implement the [HomeMenu].
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
        width: 300,
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width *0.75,
            height: MediaQuery.of(context).size.width *0.2,
            onPressed: () {
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
