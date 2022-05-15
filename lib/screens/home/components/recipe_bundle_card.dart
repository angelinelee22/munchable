import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:munchable/models/RecipeBundle.dart';

import '../../../size_config.dart';

class RecipeBundleCard extends StatelessWidget {
  final RecipeBundle? recipeBundle;
  final Function()? press;

  const RecipeBundleCard({Key? key, this.recipeBundle, this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: recipeBundle!.color,
          borderRadius: BorderRadius.circular(defaultSize! * 1.8), //18
          border: Border.all(
            color: Colors.blueGrey,
            width: 3,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
                child: Image.asset(
                  recipeBundle!.imageSrc ?? "",
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          recipeBundle!.title ?? "",
                          style: TextStyle(
                              fontSize: defaultSize * 1.6, //16
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: defaultSize * 0.5), // 5
                        buildInfoRow(
                          defaultSize,
                          iconSrc: "assets/icons/clock.svg",
                          text: "${recipeBundle!.minutes} min",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildInfoRow(double defaultSize, {String? iconSrc, text}) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(iconSrc!),
        SizedBox(width: defaultSize), // 10
        Text(
          text,
          style: TextStyle(
            fontSize: defaultSize * 1.2, //12
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
