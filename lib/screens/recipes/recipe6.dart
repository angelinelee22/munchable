import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Recipe6 extends StatefulWidget {
  const Recipe6({Key? key}) : super(key: key);

  @override
  _RecipeState6 createState() => _RecipeState6();
}

class _RecipeState6 extends State<Recipe6> {
  bool ingredientsState = true;
  List<String> categories = ["Ingredients", "Directions"];

  // By default first one is selected
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spaghetti and Meatballs'),
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
          Text('1 lb. spaghetti'),
          Text('1 lb. ground beef'),
          Text('1/3 cup bread crumbs'),
          Text('1/4 cup finely chopped parsley'),
          Text('1/4 cup freshly grated Parmesan'),
          Text('1 egg'),
          Text('2 garlic cloves, minced'),
          Text('Salt'),
          Text('Pepper'),
          Text('1/2 tsp. red pepper flakes'),
          Text('2 tbsp. extra-virgin olive oil'),
          Text('1/2 cup onion, finely chopped'),
          Text('1 (28 oz.) can crushed tomatoes'),
          Text('1 bay leaf'),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          buildDirections(
              '1',
              'In a large pot of boiling salted water, cook spaghetti '
                  'according to package instructions. Drain.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections(
              '2',
              'In a large bowl, combine beef with bread '
                  'crumbs, parsley, Parmesan, egg, garlic, 1 teaspoon salt, and '
                  'red pepper flakes. Mix until just combined then form into 16 '
                  'balls.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections(
              '3',
              'In a large pot over medium high heat, heat '
                  'oil. Add meatballs and cook, turning occasionally, until '
                  'browned on all sides, about 10 minutes. Transfer meatballs to '
                  'a plate.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections(
              '4',
              'Add onion to pot and cook until soft, 5 '
                  'minutes. Add crushed tomatoes and bay leaf. Season with salt '
                  'and pepper, and bring to a simmer. Return meatballs to pot and '
                  'cover. Simmer until sauce has thickened, 8 to 10 minutes.'),
          const SizedBox(
            height: 20,
          ),
          buildDirections(
              '5',
              'Serve pasta with a healthy scoop of meatballs, '
                  'and sauce. Top with parmesan.'),
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
