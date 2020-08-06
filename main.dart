import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(VideoApp());

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

var song;
var audio = AudioCache();
var audioPlayer = AudioPlayer();

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('video/videoplayback.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Multimedia App",
            style: TextStyle(color: Colors.red),
          ),
          leading: Icon(
            Icons.library_music,
            color: Colors.redAccent,
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Card(
                    shape: Border(),
                    color: Colors.redAccent,
                    child: _controller.value.initialized
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                        : Container()),
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  color: Colors.black,
                  child: Row(
                    children: <Widget>[
                      Card(
                        child: RaisedButton(
                          onPressed: () => audio.play('audio.mp3'),
                          child: Container(
                            height: 70,
                            width: 100,
                            child: Image.asset('images/565336.jpg'),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      Container(
                          child: Card(
                        color: Colors.red,
                        child: Text(
                          "   Song 1 ",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ))
                    ],
                  )),
              Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  color: Colors.black,
                  child: Row(
                    children: <Widget>[
                      Card(
                        child: RaisedButton(
                          onPressed: () {
                            var audio = AudioCache();
                            audio.play('goat.mpeg');
                          },
                          child: Container(
                            height: 70,
                            width: 100,
                            child: Image.asset('images/565336.jpg'),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      Container(
                          child: Card(
                        color: Colors.red,
                        child: Text(
                          "   Song 2 ",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
