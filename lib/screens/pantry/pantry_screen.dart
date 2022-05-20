import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:munchable/screens/pantry/components/ingredients_list.dart';
import 'package:munchable/constants.dart';

int itemCount = 0;
List<String> ingredients = List.from(Data.ingredientsList);
List indices = [];
List newIndices = [];

// Pantry page needs to be stateful to account for the dynamic list of ingredients
class PantryScreen extends StatefulWidget {
  const PantryScreen({Key? key}) : super(key: key);

  String get title => "Pantry";
  @override
  State<StatefulWidget> createState() => _PantryScreenState();
}

class _PantryScreenState extends State<PantryScreen> {
  final key = GlobalKey<AnimatedListState>();
  final items = [];

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text(widget.title),
      centerTitle: true,
      backgroundColor: kPrimaryColor,
    ),
    body: Stack(
      children: [

        /* TODO: Figure out some way to swap between this default text and the list depending on the itemCount
        // If there are no items in the list, display the default text
        itemCount == 0 ?
        Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 150),
            child: const Text("Your pantry is empty,\n add ingredients to personalize your recipes!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey)
            )
        ) :
        // Otherwise, display the list of ingredients
        */

        Expanded(
          child:
          AnimatedList(
            key: key,
            initialItemCount: itemCount,
            itemBuilder: (context, index, animation) =>
                buildItem(items[index], index, animation),
          )
        ),

        // Button which navigates to page containing list of ingredients
        Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.bottomCenter,
          child: buildNavButton(),
        ),
      ],
    ),
  );

  // Allows for the ingredients to be clicked to be removed
  Widget buildItem(item, int index, Animation<double> animation) =>
      IngredientItemWidget(
        item: item,
        animation: animation,
        onClicked: ()  => removeItem(index),
      );

  // Constructor for the ingredients navigation button
  Widget buildNavButton() => RaisedButton(
    child: const Text(
      'Add Item to Pantry',
      style: TextStyle(fontSize: 20),
    ),
    color: kPrimaryColor,
    textColor: Colors.white,
    onPressed: ()  {
      Navigator.push(
        context,

        // Navigate to the ingredients page
        MaterialPageRoute(builder: (context) => IngredientsPage()
        ),
      ).then((_) {
        // Build the animated list based on what was checked off
        for (int x in newIndices){
          if (!indices.contains(x)){
            insertItem(itemCount, ingredients[x]);
            indices.add(x);
          }
        }
        newIndices.clear();
      });
    }
  );



  // Adds an item to the ingredients list
  void insertItem(int index, String item) {
    items.insert(index, item);
    key.currentState?.insertItem(index);
    itemCount++;
  }

  // Removes an item from the ingredients list
  void removeItem(int index) {
    int ingredIndex = ingredients.indexOf(items[index]);
    indices.remove(ingredIndex);
    final item = items[index];
    itemCount--;
    items.remove(ingredients[ingredIndex]);

    key.currentState?.removeItem(
      index,
          (context, animation) => buildItem(item, index, animation),
    );

  }
}

// Create the widget for the individual ingredient item
class IngredientItemWidget extends StatelessWidget {
  final String item;
  final Animation<double> animation;
  final VoidCallback onClicked;

  const IngredientItemWidget({
    required this.item,
    required this.animation,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ScaleTransition(
    scale: animation,
    child: Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: ListTile(
        title: Text(item, style: const TextStyle(fontSize: 20)),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.grey, size: 15),
          onPressed: onClicked,
        ),
      ),
    ),
  );
}

// Secondary page to add ingredients
class IngredientsPage extends StatefulWidget {
  IngredientsPage();

  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State {
  List<String> pantryItems = List.from(Data.ingredientsList);
  Map<String, bool> list = {for (var item in List.from(Data.ingredientsList)) item : false};
  bool value = false;

  getItems(){
    list.forEach((key, value) {
      if(value == true)
      {
        newIndices.add(pantryItems.indexOf(key));
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
        Stack(
          children:[
            Container(
              padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
              alignment: Alignment.topCenter,
              child: RaisedButton(
                child: const Text(
                  'Add Items',
                  style: TextStyle(fontSize: 20),
                ),
                color: kPrimaryColor,
                textColor: Colors.white,
                onPressed: () {
                  getItems();
                  Navigator.pop(context);
                },
              )
            ),
            Expanded(
              child:
                Container (
                  padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: ListView(
                    children: list.keys.map((String key) {
                      return CheckboxListTile(
                        title: Text(key),
                        value: list[key],
                        activeColor: Colors.lightGreen,
                        checkColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            list[key] = value!;
                          });
                          },
                      );
                    }).toList(),
                ),
              )
          )
        ]
      )
    );
  }
}
