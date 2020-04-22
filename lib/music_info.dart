import 'package:flutter/material.dart';
import 'package:itunesapp/player_screen.dart';

class MusicInfo extends StatelessWidget {
  final String artistName, trackName, collectionName, artworkUrl100, previewUrl;
  final int trackId;

  MusicInfo({
    this.artistName,
    this.artworkUrl100,
    this.collectionName,
    this.trackName,
    this.previewUrl,
    this.trackId,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayerScreen(
                trackId: trackId,
                previewUrl: previewUrl,
                artistName: artistName,
                artworkUrl100: artworkUrl100,
                collectionName: collectionName,
                trackName: trackName,
              ),
            ));
      },
      child: Container(
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
                      child: Text(
                        artistName,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.none,
                          width: 0.5,
                        ),
                      ),
                      child: Text(
                        collectionName,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.none,
                          width: 0.5,
                        ),
                      ),
                      child: Text(
                        trackName,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
