import 'package:flutter/material.dart';
import 'music_info.dart';
import 'networking.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String queryInput;
  var songList;
  bool list = false;

  listItems() {
    return MusicInfo(
      artistName: songList['results'][0]['artistName'],
      trackName: songList['results'][0]['trackName'],
      artworkUrl100: songList['results'][0]['artworkUrl100'],
      collectionName: songList['results'][0]['collectionName'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff77d8d8),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(5, 40, 5, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 25,
                  child: Container(
                    child: TextField(
                      onChanged: (text) {
                        setState(() {
                          queryInput = text;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff4cbbb9),
                        hintText: '',
                        hintStyle: TextStyle(
                          color: Color(0xff0779e4),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Container(
                      height: 60,
                      child: FlatButton(
                        onPressed: () async {
                          var data = await Networking().getQuery(queryInput);
                          setState(() {
                            songList = data;
                            list = true;
                          });
                        },
                        child: Text('Go'),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff4cbbb9),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        border: Border.all(
                          width: 3,
                          style: BorderStyle.solid,
                          color: Color(0xff4cbbb9),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Container(
              height: 480,
              width: 400,
              color: Color(0xff77d8d8),
              child: ListView(
                children: <Widget>[
                  list
                      ? MusicInfo(
                          artistName: songList['results'][0]['artistName'],
                          trackName: songList['results'][0]['trackName'],
                          artworkUrl100: songList['results'][0]
                              ['artworkUrl100'],
                          collectionName: songList['results'][0]
                              ['collectionName'],
                          previewUrl: songList['results'][0]['previewUrl'],
                        )
                      : Text(
                          'Search for something',
                          textAlign: TextAlign.center,
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
