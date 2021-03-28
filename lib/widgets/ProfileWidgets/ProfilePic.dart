import 'package:flutter/material.dart';
import 'package:flutter_app/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      width: 155,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundImage: getProfilePic(), //profile pic
          ),
          // Positioned(
        ],
      ),
    );
  }
}
