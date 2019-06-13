import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'package:xml/xml.dart' as xml;
import 'xml test.dart';

List<String> items = [];
var client = http.Client();

hello() {
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

rssStream() {
  client
      .get("https://www.rotowire.com/rss/news.htm?sport=nba")
      .then((response) {
    return response.body;
  }).then((bodyString) {
    var channel = new RssFeed.parse(bodyString);
    print(channel.title);
    return channel.title;
  });
}

class PlayerUpdates extends StatefulWidget {
  @override
  _PlayerUpdatesState createState() => _PlayerUpdatesState();
}

var bookshelfXml = '''<?xml version="1.0"?>
    <bookshelf>
      <book>
        <title lang="english">Growing a Language</title>
        <price>29.99</price>
      </book>
      <book>
        <title lang="english">Learning XML</title>
        <price>39.95</price>
      </book>
      <price>132.00</price>
      <book>
      <title lang="english"> HEY </title>
      </book>
      <book>
        <title lang="english">Learning XML</title>
        <price>39.95</price>
      </book>
    </bookshelf>''';
var document = xml.parse(bookshelfXml);
var titles = document.findAllElements('title');
List<Widget> testText = titles.map((titles) => Text(titles.text)).toList();

Future<String> fetchData(String url) async {
  final response = await http.get(url);
  if (response.statusCode == 200)
    return response.body;
  else
    throw Exception('Failed');
}

class _PlayerUpdatesState extends State<PlayerUpdates> {
//  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: FutureBuilder(
      future: fetchData('https://www.rotowire.com/rss/news.htm?sport=nba'),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        var testd = RssFeed.parse(snapshot.data);
        List<RssItem> titles = testd.items;
        List<String> helol = titles.map((title) => title.title).toList();
        List<String> bodytext = titles.map((body) => body.description).toList();

        return ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(helol[index]),
                subtitle: Text(bodytext[index]),
              );
            });
      },
    )
////                  return ListView.builder(
////                      itemCount:
////                          1, // TODO:consider setState prevent length error
////                      itemBuilder: (context, index) {
////                        return ListTile(
////                          title: Text(titless[index]),
////                          subtitle: Text('${document.text}'),
////                        );
////                      });
//                })
            )); //TODO:Return
  }
}
