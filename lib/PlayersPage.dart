import 'package:flutter/material.dart';

import 'home_page.dart';

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
                    IconButton(icon: Icon(Icons.star)), //TODO starred players watchlist
                    Icon(Icons.people), // TODO compare player stats
                    Icon(Icons.receipt), // TODO NBA team/player news
                    Icon(Icons.blur_linear) // TODO Fantasy news
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 380,
                child: Card( //TODO create search function players by name(first || last names)
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
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                  Text('10'),
                                  Text('68'),
                                  Text('0'),
                                  Text('60%'),
                                ],),
                              ],
                            )
                          ),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text('10'),
                                      Text('68'),
                                      Text('0'),
                                      Text('60%'),
                                    ],),
                                ],
                              )
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

            ],
          ),
        ));
  }
}
