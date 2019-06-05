import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'package:xml/xml.dart' as xml;

List<String> items = [];

class PlayerUpdates extends StatefulWidget {
  @override
  _PlayerUpdatesState createState() => _PlayerUpdatesState();
}

class _PlayerUpdatesState extends State<PlayerUpdates> {
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        getFeed(),
//        Text(channel),
      ],
    )); //TODO:Return
  }

  getFeed() {
    var client = http.Client();
    client
        .get("https://developer.apple.com/news/releases/rss/releases.rss")
        .then((response) {
      return response.body;
    }).then((bodyString) {
      var channel = new RssFeed.parse(bodyString);
      print(channel);
      return channel;
    });
  }
}
