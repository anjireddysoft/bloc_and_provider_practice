import 'dart:ffi';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_practice/provider/celebrity_provider.dart';
import 'package:ui_practice/ui/camera_screen.dart';
import 'package:ui_practice/ui/celebrity/celebrity_page.dart';
import 'package:ui_practice/ui/celebrity/celebrity_screen.dart';
import 'package:ui_practice/ui/celebrity/celebrity_using_provider.dart';
import 'package:ui_practice/ui/country_standerds.dart';
import 'package:ui_practice/ui/expansion_tile.dart';
import 'package:ui_practice/ui/image_picker_screen.dart';
import 'package:ui_practice/ui/video_player.dart';


Future<void> main() async {
  // final cameras = await availableCameras();
  // print("cccccc$cameras");
  // CameraDescription cameraDescription=cameras.first;
  runApp(ChangeNotifierProvider(
    create: (context) => CelebrityProvider(),
    child: MaterialApp(home: CelebrityPage()),
  ));
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            //    Navigator.push(context, MaterialPageRoute(builder: (context)=>CelebrityScreen()));
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            color: Colors.black,
          )
        ],
      ),
      body: SingleChildScrollView(
        //physics: ScrollPhysics(),
        child: Container(
          child: Stack(
            children: [
              Image.asset(
                "assets/RC.jpeg",
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 5),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Text(
                          "Fund raising strategeis for charity",
                          style: TextStyle(
                              fontSize: 24,
                              color: Color(0xff1e1c24),
                              fontWeight: FontWeight.bold),
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.share,
                              size: 25,
                              color: Color(0xff8e8d8d),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          color: Color(0xfff1f1f1),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "By",
                                  style: TextStyle(color: Color(0xff9e9e9e)),
                                ),
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundImage: AssetImage("assets/RC.jpeg"),
                                // child: Image.asset("assets/RC.jpeg",fit: BoxFit.cover,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Ben Thampson",
                                  style: TextStyle(color: Color(0xff535157)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  color: Color(0xff868585),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  " 24th Dec 2021",
                                  style: TextStyle(color: Color(0xffc2c2c2)),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Text(
                          "12-1pm",
                          style: TextStyle(color: Color(0xffc2c2c2)),
                        )),
                        Expanded(
                            child: Text(
                          "Zoom",
                          style: TextStyle(color: Color(0xffc2c2c2)),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    Text(
                      "Event Discription",
                      style: TextStyle(fontSize: 20, color: Color(0xff202020)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lorem ipsum is simply dummy text of the printing and type setting industry."
                      " Lorem ipsum has been the industrt's standerd dummy text ever since the 1500s."
                      " when an unkknow printer took a gallery "
                      "of type and scrambled it to make a type specimen book.",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffc4c4c4),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "See more",
                      style: TextStyle(
                          color: Color(0xffa1dedf),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Event agenda",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff404040),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Color(0xffa4a3a3),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "12:00 pm - 12:30 pm CST \n- Demo and training",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffafafaf),
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Color(0xffa4a3a3),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "12:00 pm - 12:30 pm CST \n- Questions and Answers",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffafafaf),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Divider(),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Add to Calendar",
                          style: TextStyle(
                              color: Color(0xff404040),
                              fontWeight: FontWeight.bold),
                        )),
                        Expanded(
                            child: Text(
                          "Google calendar |\n Outlook calendar | iCal",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffafafaf)),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Participants",
                          style: TextStyle(
                              color: Color(0xff404040),
                              fontWeight: FontWeight.bold),
                        )),
                        Expanded(
                            child: Text("3",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffafafaf))))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Length",
                          style: TextStyle(
                              color: Color(0xff404040),
                              fontWeight: FontWeight.bold),
                        )),
                        Expanded(
                            child: Text("60 mins",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffafafaf))))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Video platform",
                          style: TextStyle(
                              color: Color(0xff404040),
                              fontWeight: FontWeight.bold),
                        )),
                        Expanded(
                            child: Text("Zoom",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffafafaf))))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "join video event",
                          style: TextStyle(
                              color: Color(0xff404040),
                              fontWeight: FontWeight.bold),
                        )),
                        Expanded(child: Text(""))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Meeting Id",
                          style: TextStyle(
                              color: Color(0xff404040),
                              fontWeight: FontWeight.bold),
                        )),
                        Expanded(
                            child: Text("9014561234",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffafafaf))))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Passcode",
                          style: TextStyle(
                              color: Color(0xff404040),
                              fontWeight: FontWeight.bold),
                        )),
                        Expanded(
                            child: Text("859470",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffafafaf))))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Dail-In",
                          style: TextStyle(
                              color: Color(0xff404040),
                              fontWeight: FontWeight.bold),
                        )),
                        Expanded(
                            child: Text("US: +1 9014561234",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffafafaf))))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
