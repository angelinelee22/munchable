import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Recipe1 extends StatefulWidget {
  const Recipe1({Key? key}) : super(key: key);

  @override
  _RecipeState1 createState() => _RecipeState1();
}

class _RecipeState1 extends State<Recipe1> {
  bool ingredientsState = true;
  List<String> categories = ["Ingredients", "Directions"];

  // By default first one is selected
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cilantro Lime Chicken'),
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
          Text('4 tbsp extra-virgin olive oi, divided'),
          Text('Juice of 2 limes'),
          Text('1/4 cup chopped cilantro'),
          Text('2 cloves garlic, minced'),
          Text('1/2 tsp. cumin'),
          Text('Pinch crushed red pepper flakes'),
          Text('4 bone-in, skin-on chicken thighs'),
          Text('Salt'),
          Text('Pepper'),
          Text('Cooked white rice, for serving'),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          buildDirections(
              '1',
              'Whisk together 2 tablespoons oil, lime juice, cilantro, garlic, '
                  'cumin, and red pepper flakes. Add chicken and toss to coat. '
                  'Let marinate in fridge 30 minutes and up to 2 hours.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections(
              '2',
              'When ready to cook, preheat oven to 425 degrees Celsius.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections(
              '3',
              'In a large ovenproof skillet over medium-high heat, heat '
                  'remaining 2 tablespoons oil. Season chicken with salt and '
                  'pepper, then add to skillet skin-side down and pour in '
                  'remaining marinade. Sear until skin is golden and crispy, '
                  'about 6 minutes. Flip and cook 2 minutes more.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections(
              '4',
              'Transfer skillet to oven and bake until chicken is cooked '
                  'through, 10 to 12 minutes.'),
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
