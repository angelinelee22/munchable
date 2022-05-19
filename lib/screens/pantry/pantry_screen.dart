import 'package:flutter/material.dart';
import 'package:munchable/constants.dart';
import 'package:munchable/screens/pantry/components/body.dart';
import 'package:munchable/size_config.dart';

class PantryScreen extends StatelessWidget {
  const PantryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading: const SizedBox(),
      // On Android it's false by default
      centerTitle: true,
      title: const Text("Pantry"),

    );
  }
}
