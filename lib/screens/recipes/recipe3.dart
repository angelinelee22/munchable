import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Recipe3 extends StatefulWidget {
  const Recipe3({Key? key}) : super(key: key);

  @override
  _RecipeState3 createState() => _RecipeState3();
}

class _RecipeState3 extends State<Recipe3> {
  bool ingredientsState = true;
  List<String> categories = ["Ingredients", "Directions"];

  // By default first one is selected
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Honey Mustard Chicken'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
            EdgeInsets.symmetric(vertical: SizeConfig.defaultSize! * 2),
            child: SizedBox(
              height: SizeConfig.defaultSize! * 3.5, // 35
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => buildCategoryItem(index),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 2,
              vertical: SizeConfig.defaultSize! * 2,
            ),
            child: buildBody(),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        ingredientsState = !ingredientsState;
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: SizeConfig.defaultSize! * 2),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize! * 5, //50
          vertical: SizeConfig.defaultSize! * 0.5, //5
        ),
        decoration: BoxDecoration(
            color:
            selectedIndex == index ? Color(0xFFEFF3EE) : Colors.transparent,
            borderRadius: BorderRadius.circular(
              SizeConfig.defaultSize! * 1.6, // 16
            )),
        child: Text(
          categories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedIndex == index ? kPrimaryColor : Color(0xFFC2C2B5),
          ),
        ),
      ),
    );
  }

  Widget buildBody() {
    if (ingredientsState) {
      return Wrap(
        direction: Axis.vertical,
        spacing: 15,
        children: const <Widget>[
          Text('6 chicken thighs (bone-in and skin on'),
          Text('1/2 tsp. Kosher salt'),
          Text('1/4 tsp. course ground black pepper'),
          Text('1/2 cup honey'),
          Text('1/4 cup yellow mustard'),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          buildDirections(
              '1',
              'Preheat oven to 350 degrees F (175 degrees C).'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('2', 'Season chicken thighs with salt and pepper.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('3', 'In a small bowl, combine the honey and '
              'yellow mustard.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('4', 'Add the chicken thighs to a large skillet or '
              'baking dish and cover with honey mustard sauce.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('5', 'Bake in the preheated oven for 30 minutes.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('6', 'Spoon sauce over the chicken thighs to '
              're-coat them.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('7', 'Bake for an additional 10 to 15 minutes.'),
        ],
      );
    }
  }

  Widget buildDirections(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              'assets/icons/green-circle.png',
              scale: 25,
            ),
            Text(
              number,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          child: Text(text),
        ),
      ],
    );
  }
}
