import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Recipe0 extends StatefulWidget {
  const Recipe0({Key? key}) : super(key: key);

  @override
  _RecipeState0 createState() => _RecipeState0();
}

class _RecipeState0 extends State<Recipe0> {
  bool ingredientsState = true;
  List<String> categories = ["Ingredients", "Directions"];

  // By default first one is selected
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cheesy Beef Quesadillas'),
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
          Text('1 lb. ground beef'),
          Text('Salt'),
          Text('Pepper'),
          Text('2 cloves garlic, minced'),
          Text('1 onion, diced'),
          Text('1 tbsp. taco seasoning'),
          Text('2 tbsp. tomato paste'),
          Text('8 ox. can black beans, rinsed and drained'),
          Text('2 avocados, pitted and diced'),
          Text('1/4 cup chopped cilantro'),
          Text('4 tsp. canola oil, divided'),
          Text('4 large flour tortillas'),
          Text('8 oz. shredded white cheddar'),
          Text('1 lime, cut into wedges'),
          Text('Sour cream, for serving'),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          buildDirections(
              '1',
              'In a large cast-iron skillet over medium-high'
                  ' heat, brown beef, breaking up with a wooden spoon. Season '
                  'with salt and pepper. Saute with garlic and onion until '
                  'softened, 3 to 4 minutes.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('2', 'Add taco seasoning, tomato paste, 1 tbsp water '
              'and black beans; cook on medium-low for 5 minutes. Turn off'
              'heat and mix in avocado and cilantro.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('3', 'Warm a large non-stick pan over medium heat '
              'with 1 teaspoon oil. Place a flour tortilla in the pan and '
              'sprinkle half with cheese, beef mixture and more cheese. Fold '
              'tortilla over and fry lightly on both sides until cheese is '
              'melted. Repeat with remaining tortillas. To save time, use'
              'two non-stick pans.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections('4', 'Cut quesadillas into wedges and serve with '
              'lime wedges and sour cream.'),
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
