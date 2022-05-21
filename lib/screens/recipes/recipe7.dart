import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Recipe7 extends StatefulWidget {
  const Recipe7({Key? key}) : super(key: key);

  @override
  _RecipeState7 createState() => _RecipeState7();
}

class _RecipeState7 extends State<Recipe7> {
  bool ingredientsState = true;
  List<String> categories = ["Ingredients", "Directions"];

  // By default first one is selected
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stuffed Mushrooms'),
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
          Text('Cooking spray, for pan'),
          Text('1 1/2 lb. baby mushrooms'),
          Text('2 tbsp. butter'),
          Text('2 cloves garlic, minced'),
          Text('1/4 cup breadcrumbs'),
          Text('Salt'),
          Text('Pepper'),
          Text('1/4 cup Parmesan'),
          Text('4 oz. cream cheese, softened'),
          Text('2 tbsp. freshly chopped parsley'),
          Text('1 tbsp. freshly chopped thyme'),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          buildDirections(
              '1',
              'Preheat oven to 400 degrees F. Grease a baking sheet with '
                  'cooking spray. Remove stems from mushrooms and roughly chop '
                  'stems. Place mushroom caps on baking sheet.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections(
              '2',
              'In a medium skillet over medium heat, melt '
                  'butter. Add chopped mushroom stems and cook until most of the '
                  'moisture is out, 5 minutes. Add garlic and cook until fragrant, '
                  '1 minute. Add breadcrumbs and let toast slightly, 3 minutes. '
                  'Season with salt nad pepper. Remove from heat and let cool '
                  'slightly.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections(
              '3',
              'In a large bowl mix together mushroom stem '
                  'mixture, Parmesan, cream cheese, parsley, and thyme. Season '
                  'with salt and pepper. Fill mushroom caps with filling and '
                  'sprinkle with more Parmesan.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections(
              '4',
              'Bake until mushrooms are soft and the tops '
                  'are golden, 20 minutes.'),
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
