import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Recipe2 extends StatefulWidget {
  const Recipe2({Key? key}) : super(key: key);

  @override
  _RecipeState2 createState() => _RecipeState2();
}

class _RecipeState2 extends State<Recipe2> {
  bool ingredientsState = true;
  List<String> categories = ["Ingredients", "Directions"];

  // By default first one is selected
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classic Chili'),
        backgroundColor: kPrimaryColor,
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
          Text('1 tbsp. olive oil'),
          Text('1 medium yellow onion (diced)'),
          Text('1 lb 90% lean ground beef'),
          Text('2 1/2 tbsp. chili powder'),
          Text('2 tbsp. ground cumin'),
          Text('2 tbsp. granulated sugar'),
          Text('2 tbsp. tomato paste'),
          Text('1 tbsp. garlic powder'),
          Text('1 1/2 tbsp. salt'),
          Text('1/2 tbsp. ground black pepper'),
          Text('1/4 tbsp. ground cayenne pepper (optional)'),
          Text('1 1/2 cups beef broth'),
          Text('1 (15 oz.) can petite diced tomatoes'),
          Text('1 (16 oz.) can red kidney beans, drained and rinsed'),
          Text('1 (8oz.) can tomato sauce'),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          buildDirections(
              '1',
              'Add the olive oil toa large soup pot and place it over '
                  'medium-high heat for two minutes. Add the onion. Cook for '
                  '5 minutes, stirring occasionally.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections(
              '2',
              'Add the ground beef to the pot. Break it '
                  'apart with a wooden spoon. Cook for 6 - 7 minutes, until the '
                  'beef is browned, stirring occasionally.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections(
              '3',
              'Add the chili powder, cumin, sugar, tomato '
                  'paste, garlic powder, salt, pepper, and optional cayenne. Stir '
                  'until well combined.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections(
              '4',
              'Add the broth, diced tomatoes (with their '
                  'juice), drained beans, and tomato sauce. Stir well.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections(
              '5',
              'Bring the liquid to a low boil. Then, reduce '
                  'the heat (low to medium-low) to gently simmer the chili, '
                  'uncovered, for 20-25 minutes, stirring occasionally.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections(
              '6',
              'Remove the pot from the heat. Let the chili '
                  'rest for 5 - 10 minutes before serving.'),
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
