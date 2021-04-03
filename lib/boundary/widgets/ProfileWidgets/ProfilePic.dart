import 'package:flutter/material.dart';
import 'package:flutter_app/control/Authenticator.dart';
import 'package:flutter/cupertino.dart';

/// This is the boundary class for displaying a Profile Picture widget.
///
/// Used in [ProfileUI].
class ProfilePic extends StatelessWidget {

  /// Class constructor for [ProfilePic].
  const ProfilePic({
    Key key,
  }) : super(key: key);

  /// Widget build method to implement [ProfilePic].
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
