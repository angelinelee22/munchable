import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Info extends StatelessWidget {
  const Info({
    Key? key,
    this.initials,
    this.name,
    this.email,
  }) : super(key: key);
  final String? name, email, initials;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return SizedBox(
      height: defaultSize * 24, // 240
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: defaultSize * 15, //150
              color: kPrimaryColor,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container (
                  height: defaultSize * 12, //140
                    width: defaultSize * 12,
                  margin: EdgeInsets.only(bottom: defaultSize, top: 0), //10
                  child: CircleAvatar(
                    backgroundColor: const Color(0xffdcdede),
                    child: Text(initials!,
                        style: TextStyle(
                          fontSize:  60, // 22
                          color: kTextColor,
                        )),
                  ),
                ),
                Text(
                  name!,
                  style: TextStyle(
                    fontSize: defaultSize * 2.2, // 22
                    color: kTextColor,
                  ),
                ),
                SizedBox(height: defaultSize / 2), //5
                Text(
                  email!,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8492A2),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
