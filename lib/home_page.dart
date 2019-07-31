import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_fan/team_roster_page.dart';

var bgColorBlue = Colors.blue[900];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<String> standHeadings = ['Rank', 'Team', 'W-T-L', 'GB'];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColorBlue,
        centerTitle: true,
        leading: FlatButton(
//          color: Colors.blue,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
//          padding: EdgeInsets.all(8.0),
          splashColor: Colors.blueAccent,
          child: Icon(Icons.home),
          onPressed: () => print('LeageHome'),
        ),
        title: Text('BEST LEAGUE'),
        actions: [
          FlatButton(
            textColor: Colors.white,
            disabledColor: Colors.red,
            child: Icon(Icons.message),
            onPressed: () => print('LeagueChat'),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            color: bgColorBlue,
            child: Card(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text('Standings',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold)),
                      Text('View Details')
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.values[3],
                      children: standHeadings
                          .map((string) => Text(
                                string,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ))
                          .toList()),
                  Divider(
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Container(
              color: Colors.white,
              child: MaterialButton(
                  child: Icon(Icons.accessibility),
                  onPressed: () =>
                      Navigator.of(context).pushNamed('TeamRosterPage'))),
          Container(height: 200, color: bgColorBlue),
        ],
      ),
    );
  }
}
