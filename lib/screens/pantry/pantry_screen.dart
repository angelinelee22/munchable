import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:munchable/components/loading.dart';
import 'package:munchable/screens/pantry/components/ingredients_list.dart';
import 'package:munchable/constants.dart';
import 'package:munchable/services/database.dart';

var listState = GlobalKey<
    AnimatedListState>(); // Used to save the state of the animated list
int itemCount = 0; // Current number of ingredients the user has
List currentItems = []; // List of strings of current ingredient items
List newItems = []; // List of strings of new ingredient items to add

// Pantry page needs to be stateful to account for the dynamic list of ingredients
class PantryScreen extends StatefulWidget {
  const PantryScreen({Key? key}) : super(key: key);

  String get title => "Pantry";
  @override
  State<StatefulWidget> createState() => _PantryScreenState();
}

class _PantryScreenState extends State<PantryScreen> {
  // Inherit the global state of the list and the ingredients list
  final key = listState;
  List<dynamic> items = currentItems;
  String textHolder = '';

  @override
  void initState() {
    if (itemCount == 0) {
      textHolder =
          "Your pantry is empty,\n add ingredients to personalize your recipes!";
    } else {
      textHolder = '';
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Loading();
            } else {
              List<dynamic> _pantry = snapshot.data["pantry"];
              itemCount = _pantry.length;
              items = _pantry;
              return Stack(
                children: [
                  // If there are no items in the list, display the default text
                  Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 75),
                      child: Text(textHolder,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.grey))),

                  // Dynamic list of ingredient items
                  Positioned.fill(
                      child: AnimatedList(
                    key: key,
                    initialItemCount: itemCount,
                    clipBehavior: Clip.antiAlias,
                    itemBuilder: (context, index, animation) =>
                        buildItem(items[index], index, animation),
                  )),

                  // Button which navigates to page containing list of ingredients
                  Container(
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.bottomCenter,
                    child: buildNavButton(),
                  ),
                ],
              );
            }
          }));

  // Allows for the ingredients to be clicked to be removed
  Widget buildItem(item, int index, Animation<double> animation) =>
      IngredientItemWidget(
        item: item,
        animation: animation,
        onClicked: () => removeItem(index),
      );

  // Constructor for the navigator button
  Widget buildNavButton() => RaisedButton(
      child: const Text(
        'Add Item to Pantry',
        style: TextStyle(fontSize: 20),
      ),
      color: kPrimaryColor,
      textColor: Colors.white,
      onPressed: () {
        Navigator.push(
          context,

          // Navigate to the ingredients page
          MaterialPageRoute(builder: (context) => IngredientsPage()),

          // After we return from the ingredients page,
        ).then((_) {
          // Build the animated list based on what was checked off
          for (String x in newItems) {
            // Avoid adding duplicate items to the list
            if (!currentItems.contains(x)) {
              // Add the item to the dynamic list, and update the global state
              insertItem(itemCount, x);
              listState = key;
              currentItems.add(x);
            }
          }
          // Clear the newItems array for the next time the user wants to add ingredients
          newItems.clear();
          changeText();
        });
      });

  changeText() {
    if (itemCount == 0) {
      setState(() {
        textHolder =
            "Your pantry is empty,\n add ingredients to personalize your recipes!";
      });
    } else {
      setState(() {
        textHolder = '';
      });
    }
  }

  // Adds an item to the ingredients list
  // (index parameter is the index in the dynamic list where the item should be added)
  void insertItem(int index, String item) {
    items.insert(index, item);
    key.currentState?.insertItem(index);
    itemCount++;
    DatabaseService(uid: FirebaseAuth.instance.currentUser?.uid)
        .updateUserPantry(items);
  }

  // Removes an item from the ingredients list
  // (index parameter is the index in the dynamic list where the item should be removed)
  void removeItem(int index) {
    final item = items[index];

    itemCount--;
    items.remove(item);
    currentItems.remove(item);

    key.currentState?.removeItem(
      index,
      (context, animation) => buildItem(item, index, animation),
    );

    changeText();
    DatabaseService(uid: FirebaseAuth.instance.currentUser?.uid)
        .updateUserPantry(items);
  }
}

// Create the widget for the individual ingredient item in the dynamic list
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
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: ListTile(
            title: Text(item, style: const TextStyle(fontSize: 18)),
            dense: true,
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.grey, size: 20),
              onPressed: onClicked,
            ),
          )));
}

// Secondary page to add ingredients
class IngredientsPage extends StatefulWidget {
  IngredientsPage();

  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

// Creates a page with a list of ingredients and checkboxes for selection
class _IngredientsPageState extends State {
  TextEditingController editingController = TextEditingController();

  Map<String, bool> permanentList = {
    for (var item in List.from(Data.ingredientsList)) item: false
  };
  Map<String, bool> list = {};
  bool value = false;

  @override
  void initState() {
    list.addAll(permanentList);
    super.initState();
  }

  // When we hit the return button, accumulate all the ingredients whose box was checked
  getItems() {
    list.forEach((key, value) {
      if (value == true) {
        newItems.add(key);
      }
    });
  }

  void filterSearchResults(String query) {
    List<String> dummyIngredients = permanentList.keys.toList();

    // Check if the search query is in the list
    if (query.isNotEmpty) {
      query = query.toLowerCase();
      Map<String, bool> filteredListData = <String, bool>{};

      for (int i = 0; i < dummyIngredients.length; i++) {
        if (dummyIngredients[i].toLowerCase().contains(query)) {
          filteredListData[dummyIngredients[i]] =
              list[dummyIngredients[i]] ?? false;
        }
      }

      // Filter the list based on the search results
      setState(() {
        list.clear();
        list.addAll(filteredListData);
      });
      return;
      // Return the list to its' default state
    } else {
      setState(() {
        list.clear();
        list.addAll(permanentList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          // Button to return to the previous page and add the checked items to the pantry
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
              )),
          // Search bar to filter the list of ingredients
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 100, 8, 8),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              controller: editingController,
              decoration: const InputDecoration(
                  labelText: "Search",
                  hintText: "Search Ingredients",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          // List of ingredients
          Expanded(
              child: Container(
            padding: const EdgeInsets.fromLTRB(0, 165, 0, 0),
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: list.keys.map((String key) {
                return CheckboxListTile(
                  title: Text(key),
                  value: list[key],
                  activeColor: Colors.lightGreen,
                  checkColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      list[key] = value!;
                      permanentList[key] = value;
                    });
                  },
                );
              }).toList(),
            ),
          ))
        ]));
  }
}
