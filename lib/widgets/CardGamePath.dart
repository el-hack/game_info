import 'package:flutter/material.dart';

class CustomPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0 , 0);
    path.lineTo(size.width - 20 , 20);
    path.quadraticBezierTo(size.width ,20, size.width , 40 );
    path.lineTo(size.width , size.height);
    path.lineTo(0 , size.height);
    // path.lineTo(0, 142.549 * size.height);
    // path.cubicTo(4.02944 * size.width, 147.52 * size.height, 9 * size.width,
    //     151.549 * size.height, 9.6191 * size.width, 0.66326 * size.height);
    // path.lineTo(157.717 * size.width, 10.875 * size.height);
    // path.cubicTo(
    //     162.257 * size.width,
    //     11.188 * size.height,
    //     165.848 * size.width,
    //     14.8397 * size.height,
    //     166.086 * size.width,
    //     19.3835 * size.height);
    // path.lineTo(172.505 * size.width, 142.079 * size.height);
    // path.cubicTo(
    //     172.774 * size.width,
    //     147.227 * size.height,
    //     168.672 * size.width,
    //     151.549 * size.height,
    //     163.517 * size.width,
    //     151.549 * size.height);
    // path.lineTo(0, 9.64193 * size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
