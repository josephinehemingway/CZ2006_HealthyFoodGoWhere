import 'package:flutter/material.dart';

/// This is the boundary class for displaying a reusable menu button widget.
///
/// Used in [ProfileUI].
class ProfileMenu extends StatelessWidget {

  /// Class constructor for [ProfileMenu].
  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    this.press,
  }) : super(key: key);

  /// Parameters for [ProfileMenu].
  ///
  /// The title of the button.
  final String text;

  /// Parameters for [ProfileMenu].
  ///
  /// The icon displayed on the button.
  final Widget icon;

  /// Parameters for [ProfileMenu]
  ///
  /// Logic that will be carried out when the button is pressed.
  final VoidCallback press;

  /// Widget build method to implement the [ProfileMenu].
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
