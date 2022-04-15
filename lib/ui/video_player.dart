import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer_Screen extends StatefulWidget {
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer_Screen> {
  VideoPlayerController? _controller;
  List<String> clipList = [
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
  ];

  @override
  void initState() {
    // TODO: implement initState
    _initializeAndPlay(0);
    super.initState();
  }

  void _initializeAndPlay(int index) async {
    print("_initializeAndPlay ---------> $index");
    final clip = clipList[index];
    print("clip$clip");
    _controller = VideoPlayerController.network(clip)
      ..initialize().then((_) {
        print("controller initialised");
        setState(() {});
        _controller!.play();
      });

    /*  final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdated);
      old.pause();
      debugPrint("---- old contoller paused.");
    }*/

    debugPrint("---- controller changed.");
  }

  @override
  Widget build(BuildContext context) {
    print("_controllers${_controller}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    )
                  : Center(
                      child: Container(
                      child: Center(child: Text("No Video is there")),
                    )),
            ),
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: clipList.length,
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      onTap: (){
                        _initializeAndPlay(index);
                      },
                      child: Card(

                        elevation: 10,
                        child: ListTile(
                          title: Text(clipList[index]),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
