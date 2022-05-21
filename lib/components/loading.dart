import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:munchable/constants.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kPrimaryColor,
        child: Center(
            child: SpinKitChasingDots(
                color: Color.fromARGB(255, 71, 100, 37), size: 50.0)));
  }
}
