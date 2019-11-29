import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_table/json_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_fan/test.dart';

import 'home_page.dart';

class PlayerDetails {
  final String firstName;
  final String lastName;
  final String playerId;
  final String teamId;

  PlayerDetails({this.firstName, this.lastName, this.playerId, this.teamId});

  factory PlayerDetails.fromJson(Map<String, dynamic> json) {
    return PlayerDetails(
      firstName: json['firstName'],
      lastName: json['lastName'],
      playerId: json['personId'],
      teamId: json['teamId']
    );
  }

}

Future<List<PlayerDetails>> loadPlayerList() async {
  final response = await http.get('http://data.nba.net/data/10s/prod/v1/2019/players.json');
//  PlayerDetails.fromJson(json.decode(response.body));
  final Map<String, dynamic> playerListJson = jsonDecode(response.body);
  List<PlayerDetails> players = List<PlayerDetails>();
  playerListJson['league']['standard'].forEach((player) => players.add(PlayerDetails.fromJson(player)));
//  playerListJson
//  print(playerListJson['league']['standard']);
//  print(response.body);
  return players;
}

loadJSON () async {
  final response = await http.get('http://data.nba.net/data/10s/prod/v1/2019/players.json');
return response.body;
}

class PlayersPage extends StatefulWidget {
  @override
  _PlayersPageState createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColorBlue,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Players Page'),
          backgroundColor: bgColorBlue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 60,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                        icon:
                            Icon(Icons.star)), //TODO starred players watchlist
                    Icon(Icons.people), // TODO compare player stats
                    Icon(Icons.receipt), // TODO NBA team/player news
                    Icon(Icons.blur_linear) // TODO Fantasy news
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 380,
                child: Card(
                  //TODO create search function players by name(first || last names)
                  child: TextFormField(
                    maxLines: 1,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusColor: Colors.white,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search by  player name',
                    ),
                  ),
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Top Available Players'),
                          Text(' View All >')
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('All Positions'),
                          Text('PG'),
                          Text('SG'),
                          Text('G'),
                          Text('SF'),
                        ]),
                    Divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Proj Rank'),
                          Text('Rank'),
                          Text('Adds'),
                          Text('%Own'),
                        ]),
                    Divider(),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, int) {
                        return Container(
                          height: 70,
                          child: GridTile(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CircleAvatar(
                                      child: Icon(Icons.add_circle_outline),
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.transparent),
                                  CircleAvatar(
                                    radius: 30.0,
                                    backgroundColor: Colors.transparent,
                                    child: Image.network(
                                        'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/136.png'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'V. Carter' + // PLAYER NAME
                                          ' Sac - SG\n' // PLAYER POSITION(S)
                                              'W 105-102 @OKC', // GAME TODAY
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ),
                                ],
                              ),
                              footer: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text('10'),
                                      Text('68'),
                                      Text('0'),
                                      Text('60%'),
                                    ],
                                  ),
                                ],
                              )),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Transaction Trends'),
                          Text(' View All >')
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('All Positions'),
                          Text('PG'),
                          Text('SG'),
                          Text('G'),
                          Text('SF'),
                        ]),
                    Divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Proj Rank'),
                          Text('Rank'),
                          Text('Adds'),
                          Text('%Own'),
                        ]),
                    Divider(),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, int) {
                        return Container(
                          height: 70,
                          child: GridTile(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CircleAvatar(
                                      child: Icon(Icons.add_circle_outline),
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.transparent),
                                  CircleAvatar(
                                    radius: 30.0,
                                    backgroundColor: Colors.transparent,
                                    child: Image.network(
                                        'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3149673.png'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'V. Carter' + //TODO PLAYER NAME
                                          ' Sac - SG\n' //TODO PLAYER POSITION(S)
                                              'W 105-102 @OKC', //TODO GAME TODAY
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ),
                                ],
                              ),
                              footer: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text('10'),
                                      Text('68'),
                                      Text('0'),
                                      Text('60%'),
                                    ],
                                  ),
                                ],
                              )),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Transaction Trends'),
                          Text(' View All >')
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('All Positions'),
                          Text('PG'),
                          Text('SG'),
                          Text('G'),
                          Text('SF'),
                        ]),
                    Divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Proj Rank'),
                          Text('Rank'),
                          Text('Adds'),
                          Text('%Own'),
                        ]),
                    Divider(),
                    SizedBox(
                      height: 300,
                      child: FutureBuilder<List<PlayerDetails>>(
                      future: loadPlayerList(),
                        builder: (context, snapshot) {
                          var jsonData = snapshot.data;
                          if(snapshot.hasData) {
                            print(jsonData.length);
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index){
                                PlayerDetails playerDetails = snapshot.data[index];
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text( playerDetails.firstName),
                                    Text(playerDetails.lastName),
                                    Text( playerDetails.playerId),
//                                    Text('teamId: ${playerDetails.teamId}'),
                                  ],
                                );
                          });
                        } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          return Container();

//                        return ListView.builder(
//                            itemCount: 2,
//                            itemBuilder:(BuildContext context, int index) {
//                          return Card(
//                            child: Column(children: <Widget>[
//                              Text('NAME: ' + jsonData.),
//                              Text('URL: ' + jsonData[index]["origin"])
//                            ],
//                            ),
//                          );
//                        });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  List<Players> parseJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Players>((json) => Players.fromJson(json)).toList();
  }
}
