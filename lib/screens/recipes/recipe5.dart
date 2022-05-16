import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Recipe5 extends StatefulWidget {
  const Recipe5({Key? key}) : super(key: key);

  @override
  _RecipeState5 createState() => _RecipeState5();
}

class _RecipeState5 extends State<Recipe5> {
  bool ingredientsState = true;
  List<String> categories = ["Ingredients", "Directions"];

  // By default first one is selected
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pork Chops in Mushroom and Garlic Gravy'),
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
          Text('4 boneless pork chops'),
          Text('Salt'),
          Text('Pepper'),
          Text('2 tbsp. butter'),
          Text('2 tbsp. oil'),
          Text('10 - 12 button mushrooms'),
          Text('1 small chopper onion'),
          Text('2 tbsp. all purpose flour'),
          Text('1 1/2 cups beef broth'),
          Text('Chopped parsley for garnish'),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          buildDirections(
              '1',
              'Season the pork chops with salt and pepper to taste.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('2', 'Add about 2 tbsp. of butter to a preheated '
              'pan followed by some oil.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('3', 'Put the pork chops in and sear them, over '
              'medium high heat, until cooked through. This should take about '
              '3 minutes on each side. Set them aside on a plate.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('4', 'In the same pan, add in a little more oil if '
              'necessary. Add the mushrooms in and fry until golden brown and '
              'the water has released.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('5', 'Place the onion and garlic in the pan and '
              'saute until they are fragrant.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('6', 'Add in the flour and stir until it coats the '
              'ingredients.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('7', 'Pour the beef broth in, stir, and bring to a '
              'boil, until it thickens.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('8', 'Season with salt and pepper to taste.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('9', 'Put the pork chops back in and simmer for '
              'about 3 minutes or so.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('10', 'Garnish the dish with the parsley.'),
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
