/*
// @dart=2.9
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class Image_Screen extends StatefulWidget {
  const Image_Screen({Key key}) : super(key: key);

  @override
  _Image_ScreenState createState() => _Image_ScreenState();
}

class _Image_ScreenState extends State<Image_Screen> {
  File image;
  VideoPlayerController _controller;
  File video;

  chooseImage(ImageSource source) async {
    final XFile photo = await ImagePicker().pickVideo(
      source: source,
    );
    setState(() {
      image = File(photo.path);
    });

  }
  chooseVideo(ImageSource source) async {
    final XFile photo = await ImagePicker().pickVideo(
      source: source,
    );
    video = File(photo.path);
    _controller = VideoPlayerController.file(video)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }
  @override
  initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: image != null
                  ? Container(
                      child: Image.file(
                      image,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                      height: MediaQuery.of(context).size.height / 2,
                    ))
                  : Container(),
            ),
            Container(
                child:  _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container()),
            MaterialButton(
                onPressed: () {
                  chooseImage(ImageSource.camera);
                },
                color: Colors.blue,
                child: Text("Choose from camera")),
            MaterialButton(
                onPressed: () {
                  chooseImage(ImageSource.gallery);
                },
                color: Colors.yellow,
                child: Text("Choose from gallery"))
          ],
        ),
      ),
    );
  }

}
*/
