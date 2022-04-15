import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Expansion_tile_screen extends StatefulWidget {
  const Expansion_tile_screen({Key? key}) : super(key: key);

  @override
  _Expansion_tile_screenState createState() => _Expansion_tile_screenState();
}

class _Expansion_tile_screenState extends State<Expansion_tile_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expansiontile"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ExpansionTile(
                    leading: Icon(Icons.arrow_back),
                    title: Text("DevRabbit"),
                    subtitle: Text("software company"),
                    collapsedIconColor: Colors.red,
                    collapsedTextColor: Colors.green,
                   // backgroundColor: Colors.yellow,
                    childrenPadding: EdgeInsets.all(10),
                    // tilePadding: EdgeInsets.all(5),
                    children: [
                      Text(
                          "The expansion arrow icon is shown on the right by default in "
                          "left-to-right languages (i.e. the trailing edge)."),
                      SizedBox(height: 10,),
                      Text(
                          "The expansion arrow icon is shown on the right by default in"
                          " left-to-right languages (i.e. the trailing edge).")
                    ],
                  ),
                ],
              ),
            ),
            ConstrainedBox(
              constraints:
                  BoxConstraints.expand(width: double.infinity, height: 50),
              child: Text(
                "The expansion arrow icon is shown on the right by default in"
                " left-to-right languages (i.e. the trailing edge).",
                style: TextStyle(fontFamily: 'Pacifico'),
              ),
            ),
            SizedBox(height: 10,),
            ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: double.infinity, maxHeight: 300),
              child: Image.asset(
                "assets/RC.jpeg",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
