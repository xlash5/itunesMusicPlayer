import 'package:flutter/material.dart';
import 'package:url_audio_stream/url_audio_stream.dart';

class PlayerScreen extends StatefulWidget {
  final int trackId;
  final String artistName, trackName, collectionName, artworkUrl100, previewUrl;
  PlayerScreen({
    this.trackId,
    this.artistName,
    this.artworkUrl100,
    this.collectionName,
    this.trackName,
    this.previewUrl,
  });

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  int trackId;
  String artistName, trackName, collectionName, artworkUrl100, previewUrl;
  bool notPlaying = true;
  AudioStream stream;
  @override
  void initState() {
    super.initState();
    trackId = widget.trackId;
    previewUrl = widget.previewUrl;
    artistName = widget.artistName;
    trackName = widget.trackName;
    collectionName = widget.collectionName;
    artworkUrl100 = widget.artworkUrl100;
    stream = AudioStream(previewUrl);
  }

  void setupAudio() async {
    await stream.start();
  }

  void stopAudio() async {
    await stream.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff77d8d8),
      appBar: AppBar(
        title: Text("Player Screen"),
        backgroundColor: Color(0xff77d8d8),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'artwork$trackId',
              child: Image.network(
                artworkUrl100,
                cacheWidth: 150,
                cacheHeight: 150,
              ),
            ),
            Text(artistName),
            Text(collectionName),
            Text(trackName),
            notPlaying
                ? FloatingActionButton(
                    onPressed: () async {
                      setupAudio();
                      setState(() {
                        notPlaying = false;
                      });
                    },
                    child: Icon(
                      Icons.play_arrow,
                      size: 50,
                    ),
                  )
                : FloatingActionButton(
                    onPressed: () async {
                      stopAudio();
                      setState(() {
                        notPlaying = true;
                      });
                    },
                    child: Icon(
                      Icons.stop,
                      size: 50,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
