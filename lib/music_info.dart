import 'package:flutter/material.dart';
import 'package:url_audio_stream/url_audio_stream.dart';

class MusicInfo extends StatelessWidget {
  final String artistName, trackName, collectionName, artworkUrl100, previewUrl;
  MusicInfo({
    this.artistName,
    this.artworkUrl100,
    this.collectionName,
    this.trackName,
    this.previewUrl,
  });

  @override
  Widget build(BuildContext context) {
    AudioStream stream = new AudioStream(previewUrl);

    Future<void> callAudio(String action) async {
      if (action == "start") {
        await stream.start();
      } else if (action == "stop") {
        stream.stop();
      } else if (action == "pause") {
        stream.pause();
      } else {
        stream.resume();
      }
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          width: 1,
          color: Color(0xff0779e4),
        ),
        color: Color(0xff4cbbb9),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              // color: Colors.teal,
              child: Image.network(artworkUrl100),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 100,
              // color: Colors.blue,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.none,
                        width: 0.5,
                      ),
                    ),
                    child: Text(artistName),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.none,
                        width: 0.5,
                      ),
                    ),
                    child: Text(trackName),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.none),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        callAudio("start");
                      },
                      child: Icon(
                        Icons.play_circle_filled,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
