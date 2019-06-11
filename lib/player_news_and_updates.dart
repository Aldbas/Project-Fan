import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/domain/media/license.dart';
import 'package:webfeed/webfeed.dart';
import 'package:xml/xml.dart' as xml;

List<String> items = [];
var client = http.Client();

rssStream() {
  client
      .get("https://developer.apple.com/news/releases/rss/releases.rss")
      .then((response) {
    return response.body;
  }).then((bodyString) {
    var channel = new RssFeed.parse(bodyString);
    print(channel);
    return channel.description;
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

List<RssItem> _test = [];

//List<String> hello = _test.title;
run() {
//  print(document.toString());
//  print(titles);
}
Future<String> fetchData(String url) async {
  final response = await client.get(url);
  if (response.statusCode == 200)
    return response.body;
  else
    throw Exception('Failed');
}

test2() async {
  var response =
      await client.get('http://developer.apple.com/news/rss/news.rss');
//  var document = xml.parse(response.body);
//  var titles = document.findAllElements('title');
//  return titles;
}

test() async {
  var xmlString = await client
      .get("https://developer.apple.com/news/releases/rss/releases.rss")
      .then(((response) {
    return response.body;
  }));
  var feed = RssFeed.parse(xmlString);
  print(feed.title);
//    return feed.description;
}

class _PlayerUpdatesState extends State<PlayerUpdates> {
//  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: FutureBuilder(
                future:
                    fetchData('http://developer.apple.com/news/rss/news.rss'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error');
                  }
                  var _temp = snapshot.data;
                  var document = xml.parse(_temp);
                  var titless = document
                      .findAllElements('title')
                      .map((node) => node.text)
                      .toList();

                  return ListView.builder(
                      itemCount: titless
                          .length, // TODO:consider setState prevent length error
                      itemBuilder: (context, index) {
                        return ListTile(title: Text(titless[index]));
                      });
                }))); //TODO:Return
  }
}
