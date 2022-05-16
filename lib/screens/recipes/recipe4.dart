import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Recipe4 extends StatefulWidget {
  const Recipe4({Key? key}) : super(key: key);

  @override
  _RecipeState4 createState() => _RecipeState4();
}

class _RecipeState4 extends State<Recipe4> {
  bool ingredientsState = true;
  List<String> categories = ["Ingredients", "Directions"];

  // By default first one is selected
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jalapeno Popper Chicken'),
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
          Text('6 boneless skinless chicken breasts'),
          Text('6 oz. cream cheese (softened)'),
          Text('1 cup shredded cheddar cheese'),
          Text('1/4 cup diced jalapeno peppers'),
          Text('1/4 tsp. garlic powder'),
          Text('Salt to taste'),
          Text('Pepper to taste'),
          Text('12 slices bacon (do not use thick cut bacon)'),
          Text('Cooking spray'),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          buildDirections(
              '1',
              'Preheat the oven to 375 degrees F. Coat a sheet pan with '
                  'cooking spray.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('2', 'Place the cream cheese, cheddar cheese, '
              'jalapenos and garlic powder in a bowl; stir to combine.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('3', 'Cut a deep pocket into each chicken breast, '
              'taking care not to cut all the way through to the other side.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('4', 'Fill the pocket of each chicken breast with '
              'the cream cheese mixture.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('5', 'Season the outside of the chicken breasts '
              'with salt and pepper to taste.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('6', 'Wrap each chicken breast tightly with two '
              'slices of bacon and place the chicken on the sheet pan.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('7', 'Cook for 30 minutes, or until chicken is '
              'cooked through and bacon is crisp. You can broil the chicken '
              'for 3 - 4 minutes to crisp up the bacon if needed.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('8', 'Let the chicken rest for 5 minutes, then '
              'slice and serve.'),
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
