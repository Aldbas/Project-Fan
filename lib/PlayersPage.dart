import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:json_table/json_table.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:project_fan/model/playerGameLog.dart';
import 'package:project_fan/model/playerInfo.dart';
import 'package:project_fan/nbaTeams.dart';
import 'package:project_fan/nba_api.dart';
import 'package:project_fan/test.dart';

import 'home_page.dart';

class PlayerDetails extends Equatable {
  final String firstName;
  final String lastName;
  final String personId;
  final String teamId;
  final String jerseyNumber;
  final String pos;

  PlayerDetails(
    this.firstName,
    this.lastName,
    this.personId,
    this.teamId,
    this.jerseyNumber,
    this.pos,
  );

  @override
  List<Object> get props => [personId, firstName, lastName, teamId, pos];

  factory PlayerDetails.fromJson(Map<String, dynamic> json) {
    return PlayerDetails(
      json['firstName'],
      json['lastName'],
      json['personId'],
      json['teamId'],
      json['jersey'],
      json['pos'],
    );
  }
}

class PlayersPage extends StatefulWidget {
  final Future<List<PlayerInfo>> playerList;

  const PlayersPage({Key key, this.playerList}) : super(key: key);
  @override
  _PlayersPageState createState() => _PlayersPageState();
}
class _PlayersPageState extends State<PlayersPage> {
  TextEditingController _searchQueryController;
  List<PlayerInfo> _searchResults = [];
  List<PlayerInfo> _initialData = [];

  void initState() {
    _searchQueryController = TextEditingController();
    super.initState();
  }
  void dispose() {
    _searchQueryController.dispose();
    super.dispose();
  }

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
                        icon: Icon(Icons.star)), //TODO starred players watchlist
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
                  child: TextField(
                    onChanged: querySearch,
                    keyboardType: TextInputType.text,
                    controller: _searchQueryController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusColor: Colors.white,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search by  player name',
                    ),
//                    onChanged: onQuery(text: _searchQueryController.text),
                  ),
                ),
              ),
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Transaction Trends'),
                          Text(' View All >')
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
                    SizedBox(height: 300, child: _buildAllPlayersListView()),
                    Divider(thickness: 20.0, height: 20.0),
                    Container(height: 500, child: _buildTeamRosterListView()),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildAllPlayersListView() {
    return ValueListenableBuilder(
      valueListenable: Hive.box('Players').listenable(),
      builder: (BuildContext context, Box allPlayersBox, Widget widgets) {
        return FutureBuilder<List<PlayerInfo>>(
          future: widget.playerList,
          builder: (context, snapshot) {
            _initialData = snapshot.data;
            if (snapshot.hasData) {
              return _searchResults.length != 0 || _searchQueryController.text.isNotEmpty ?
              ListView.builder(
                  itemCount: _searchResults.length,
                  itemBuilder: (BuildContext context, int index) {
                  PlayerInfo playerInfo = _searchResults[index];
                  final String playerProfilePhoto = nbaApi.getPlayerProfilePicture(playerInfo.personId);
                  if (allPlayersBox.values.contains(playerInfo)) return Container(); // remove player if already in Team

                  return Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                          icon: CircleAvatar(
                              child: Icon(Icons.add_circle_outline),
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.transparent),
                          onPressed: () => addPlayer(playerInfo)),
                      Container(height: 80, width: 80,
                          child: Image.network(playerProfilePhoto)),
                      Text(playerInfo.firstName),
                      Text(playerInfo.lastName),
                      Text(playerInfo.jersey),
                      Text(playerInfo.pos),
                      Text(playerInfo.personId)
//                                    Text('teamId: ${playerDetails.teamId}'),
                    ]);
              }) : ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    PlayerInfo playerInfo = _initialData[index];
                    final String playerProfilePhoto = nbaApi.getPlayerProfilePicture(playerInfo.personId);
                    if (allPlayersBox.values.contains(playerInfo)) return Container(); // remove player if already in Team
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                              icon: CircleAvatar(
                                  child: Icon(Icons.add_circle_outline),
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.transparent),
                              onPressed: () => addPlayer(playerInfo)),
                          Container(
                              height: 80,
                              width: 80,
                              child: Image.network(playerProfilePhoto)),
                          Text(playerInfo.firstName),
                          Text(playerInfo.lastName),
                          Text(playerInfo.jersey),
                          Text(playerInfo.pos),
                          Text(playerInfo.personId),
                        ]);
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Container(child: Text('NO DATA'));
          },
        );
      },
    );
  }

  Widget _buildTeamRosterListView() {
    return ValueListenableBuilder(
      valueListenable: Hive.box('Players').listenable(),
      builder: (BuildContext context, Box playersBox, Widget widget) {
        if (playersBox.values.isEmpty) {
          return Center(child: Text('NOTHING'));
        }
        return ListView.builder(
            itemCount: playersBox.length,
            itemBuilder: (BuildContext context, int index) {
              PlayerInfo player = playersBox.getAt(index);
//              final player = playersBox.get(index) as PlayerInfo;
              final String playerProfilePhoto =
                  nbaApi.getPlayerProfilePicture(player.personId);
              return ListTile(
                leading: Image.network(playerProfilePhoto),
                title: MaterialButton(
                    child: Text(player.firstName),
                    onPressed: () => playersBox.deleteAt(index)),
                subtitle: Text(player.personId),
              );
            });
      },
    );
  }

  void addPlayer(PlayerInfo playerInfo) {
    final playersBox = Hive.box('Players');
    if (playersBox.values.contains(playerInfo)) {
        print('Already saved');
        return null;
      } else {
        print('adding');
        playersBox.add(playerInfo);
    }
  }

  Future<void> deleteBoxKey(PlayerInfo playerInfo) async {
    final playersBox = Hive.box('Players');
    playersBox.delete(playerInfo);
    print('player deleted');
  }

  querySearch(String string)  {
    _searchResults.clear();
      setState(() {
        _searchResults = _initialData.where((player) =>  player.firstName.toLowerCase().contains(string.toLowerCase()) || player.lastName.toLowerCase().contains(string.toLowerCase())).toList();
        });
  }
}

