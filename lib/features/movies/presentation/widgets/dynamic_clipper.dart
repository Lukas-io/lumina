

import 'package:flutter/cupertino.dart';

class DynamicClipper extends CustomClipper<Rect> {
  final bool left;
  final double rotationY;
  final double positionX;


  DynamicClipper({this.left = true, this.rotationY = 1.0, this.positionX = 1.0});

  @override
  Rect getClip(Size size) {
    if (left) {
      return Rect.fromLTRB(0, 0, size.width, size.height);
    } else {
      return Rect.fromLTRB(size.width /2 , 0, size.width, size.height);
    }
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
