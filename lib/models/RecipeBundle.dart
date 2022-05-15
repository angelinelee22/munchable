import 'package:flutter/material.dart';

class RecipeBundle {
  final int? id;
  final String? title, minutes, imageSrc;
  final Color? color;

  RecipeBundle(
      {
        this.id,
        this.title,
        this.minutes,
        this.imageSrc,
        this.color});
}

// Demo list
List<RecipeBundle> recipeBundles = [
  RecipeBundle(
    id: 1,
    title: "Cheesy Beef Quesadillas",
    minutes: "20-40",
    imageSrc: "assets/images/cheesy_beef_quesadillas.png",
    color: Colors.white,
  ),
  RecipeBundle(
    id: 2,
    title: "Cilantro Lime Chicken",
    minutes: "45-65",
    imageSrc: "assets/images/cilantro_lime_chicken.png",
    color: Colors.white,
  ),
  RecipeBundle(
    id: 3,
    title: "Classic Chili",
    minutes: "40-50",
    imageSrc: "assets/images/chili.png",
    color: Colors.white,
  ),
  RecipeBundle(
    id: 4,
    title: "Honey Mustard Chicken",
    minutes: "40-60",
    imageSrc: "assets/images/honey_mustard_chicken.png",
    color: Colors.white,
  ),
  RecipeBundle(
    id: 5,
    title: "Jalapeno Popper Chicken",
    minutes: "40-60",
    imageSrc: "assets/images/jalapeno_popper_chicken.png",
    color: Colors.white,
  ),
  RecipeBundle(
    id: 6,
    title: "Pork Chops in Mushroom and Garlic Gravy",
    minutes: "20-40",
    imageSrc: "assets/images/porkchop_mushroom_gravy.png",
    color: Colors.white,
  ),
  RecipeBundle(
    id: 7,
    title: "Spaghetti and Meatballs",
    minutes: "50-70",
    imageSrc: "assets/images/spaghetti_and_meatballs.png",
    color: Colors.white,
  ),
  RecipeBundle(
    id: 8,
    title: "Stuffed Mushrooms",
    minutes: "24-45",
    imageSrc: "assets/images/stuffed_mushrooms.png",
    color: Colors.white,
  ),
];
