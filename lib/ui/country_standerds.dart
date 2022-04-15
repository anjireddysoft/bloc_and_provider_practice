import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Country_Standerds extends StatefulWidget {
  const Country_Standerds({Key? key}) : super(key: key);

  @override
  _Country_StanderdsState createState() => _Country_StanderdsState();
}

class _Country_StanderdsState extends State<Country_Standerds> {
  List list = [];

  @override
  void initState() {
    // TODO: implement initState
    loadJson();
    super.initState();
  }

  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country Standerds"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Slider(
                value: value,
                onChanged: (values) {
                  setState(() {
                    value = values;
                    print("value$value");
                  });
                },
              semanticFormatterCallback: (double newValue) {
                return '${value.round()} dollars';
              },
              label: "${value.toString()}",
                activeColor: Colors.red,
                min: 0,
                max: 100,
              ),
              Container(
                child: ListView.builder(
                    itemCount: list.length,
                    shrinkWrap: true,
                    itemBuilder: (context, int index) {
                      return ListTile(
                        title: Text("${list[index]["CountryName"]}"),
                        leading: Text("${list[index]["DialCode"]}"),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future loadJson() async {
    var jsonList = await rootBundle.loadString("assets/countries_codes.json");
    final jsonData = json.decode(jsonList);
    print("jsonData${jsonData.toString()}");
    setState(() {
      list = jsonData["Info"]["Countries"];
    });
  }
}
