import 'package:flutter/material.dart';

class Body extends StatelessWidget {
   const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
              child: Center(
              child:   TextButton(
                child: const Text('Add Items to Pantry'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.lightGreen,
                    onSurface: Colors.grey,
                ),
                    onPressed: () { /* go to ingredients page? */},
              )
            ),
          )
        ],
      ),
    );
  }
}
