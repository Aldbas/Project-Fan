import 'dart:convert';
import 'dart:math';
import 'package:html/parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'package:xml/xml.dart' as xml;
import 'package:xml2json/xml2json.dart';


List<String> items = [];
var client = http.Client();
final Xml2Json xml2json = Xml2Json();

hello() async {
  String url =
      'http://premium.rotoworld.com/rss/feed.aspx?sport=nba&ftype=news&count=12&format=rss';
  var response = await client.get(url);
  dom.Document document = parser.parse(response.body);
  var test = document.getElementsByTagName('description');
  List<String> test2 = document
      .getElementsByTagName('description')
      .map((e) => (e.text))
      .toList();

//  xml2json.parse(response.body);
//  var jsonData = xml2json.toGData();
//  var data = json.decode(jsonData);
  print(test2);
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

class PlayerUpdates extends StatelessWidget {

  Future<String> fetchData(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200)
      return response.body;
    else
      throw Exception('Failed');
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.blue[900],
          body: FutureBuilder(
            future: fetchData(
                'http://premium.rotoworld.com/rss/feed.aspx?sport=nba&ftype=news&count=12&format=rss'),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              dom.Document document = parser.parse(snapshot.data);
              var test = document.getElementsByTagName('description');
              var link = document.getElementsByTagName('link');
//        var date = document.getElementsByTagName('a10:updated');
//        List<String> testDate = date.map((date) => date.text).toList();
              List<String> test1 = document
                  .getElementsByTagName('title')
                  .map((title) => title.text)
                  .skip(1)
                  .toList();
              List<String> test2 = document
                  .getElementsByTagName('description')
                  .map((e) => e.text)
                  .skip(1)
                  .toList();

//        var testXml2Json = jsonDecode(toJson);
//        List<AtomItem> titles = testd.items;
//        List<String> headLine = titles.map((title) => title.title).toList();
//        String testBody = titles
//            .where((body) => body is RssItem && !body.content.trim().isNotEmpty)
//            .join('\n');
//        List<String> bodyText = titles.map((body) => body.content).toList();
//        List<String> date = titles.map((date) => date.published).toList();

              return ListView.builder(
                  itemCount: test2.length,
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                            Border.all(width: 4.0, color: Colors.blue[900])),
                        height: 150.0,
//                  width: 50,
                        child: ListTile(
                          title: Text(
                            test1[index],
                            textScaleFactor: .90,
                          ),
                          subtitle: Text(
                            test2[index],
                            softWrap: true,
                          ),
                        ));
                  });
            },
          )); //TODO:Return
  }
}


class RotoPlayerId {
  final int id;
  final String name;

  RotoPlayerId({this.id, this.name});

  factory RotoPlayerId.fromJson(Map<String, dynamic> json) {
    return RotoPlayerId(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}
