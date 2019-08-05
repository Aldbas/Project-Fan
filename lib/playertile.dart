import 'package:flutter/material.dart';

//TODO:ADD BACKEND NUMBERS/FIGURE OUT HOW TO GET
class Position {
  final String name;
  Position({this.name});
}

List<Position> setPosition = [
  Position(name: 'PG'),
  Position(name: 'SG'),
  Position(name: 'G'),
  Position(name: 'SF'),
  Position(name: 'PF'),
  Position(name: 'F'),
  Position(name: 'C'),
  Position(name: 'C'),
  Position(name: 'Util'),
  Position(name: 'Util'),
  Position(name: 'BN'),
  Position(name: 'BN'),
  Position(name: 'BN'),
];

class Categories {
  String cat;
  Categories({
    this.cat,
  });

  static List<Categories> getCat() {
    return <Categories>[
      Categories(cat: 'FGM/A'),
      Categories(cat: 'FG%'),
      Categories(cat: 'FTM/A'),
      Categories(cat: 'FT%'),
      Categories(cat: '3PTM'),
      Categories(cat: 'PTS'),
      Categories(cat: 'REB'),
      Categories(cat: 'AST'),
      Categories(cat: 'ST'),
      Categories(cat: 'BLK'),
      Categories(cat: 'TO'),
    ];
  }
}

class GridTileCard extends StatefulWidget {
  @override
  _GridTileCardState createState() => _GridTileCardState();
}

class _GridTileCardState extends State<GridTileCard> {
//  final Planet planet;
  final Position position;
  _GridTileCardState({
    this.position,
  });
  List<Categories> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        color: Colors.white,
        height: 90,
        child: GridTile(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                  child: Text(position.name),
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.transparent),
              CircleAvatar(
                radius: 32.0,
                backgroundColor: Colors.transparent,
                child: Image.network(
                    'http://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4277848.png&w=350&h=254'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'M. Bagley III' +
                      ' Sac - PF\n'
                          'W 105-102 @OKC',
                  style: TextStyle(fontSize: 12.0),
                ),
              )
            ],
          ),
          footer: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                '54/75',
                style: TextStyle(fontSize: 11.0, color: Colors.red),
              ),
              Text(
                '.556',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '35/50',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '.454',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '55',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '135',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '50',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '50',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '15',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '20',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '22',
                style: TextStyle(fontSize: 11.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridTilePosition extends StatelessWidget {
  final Position position;

  GridTilePosition({this.position});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        color:
            Colors.white, //TODO:ADD Conditional statement 'If already playing'
        height: 70,
        child: GridTile(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                  child: Text(position.name),
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.transparent),
              CircleAvatar(
                radius: 32.0,
                backgroundColor: Colors.transparent,
                child: Image.network(
                    'http://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4277848.png&w=350&h=254'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'M. Bagley III' +
                      ' Sac - PF\n'
                          'W 105-102 @OKC',
                  style: TextStyle(fontSize: 12.0),
                ),
              )
            ],
          ),
          footer: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                '54/75',
                style: TextStyle(fontSize: 11.0, color: Colors.red),
              ),
              Text(
                '.556',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '35/50',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '.454',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '55',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '135',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '50',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '50',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '15',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '20',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '22',
                style: TextStyle(fontSize: 11.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
