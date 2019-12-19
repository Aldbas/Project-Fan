import 'package:flutter/material.dart';

import 'home_page.dart';

class VersusStats {
  String cat;
  VersusStats({this.cat});
}

final List<VersusStats> versusStats = [
  VersusStats(cat: 'FG%'),
  VersusStats(cat: 'FT%'),
  VersusStats(cat: '3PTM'),
  VersusStats(cat: 'PTS'),
  VersusStats(cat: 'REB'),
  VersusStats(cat: 'AST'),
  VersusStats(cat: 'STL'),
  VersusStats(cat: 'BLK'),
  VersusStats(cat: 'TO'),
];

class MatchUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: <Widget>[
              Text('aRealLongName'),
              Text(
                'Best League',
                style: TextStyle(fontSize: 16.0),
              )
            ],
          ),
          backgroundColor: bgColorBlue,
        ),
        body: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.arrow_back_ios),
                Text('Week __'),
                Icon(Icons.arrow_forward_ios),
                Text('All Matchups'),
                    Icon(Icons.keyboard_arrow_down)
              ]),
            ),
            Container(
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.black,width: 3.0))),
              height: 50,
//              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Draggable(
                      childWhenDragging: Container(),
                      feedback: CircleAvatar(child: Icon(Icons.access_alarm)),
                      child: CircleAvatar(child: Icon(Icons.access_alarm))),
                  Text('4',textScaleFactor: 2.0,),
                  Column(children: <Widget>[
                    Text('HELLO'),
                    Text("ME")
                  ]),
                  Container(
                    color: Colors.black,
                    width: 3.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        border: Border.all(color: Colors.red, width: 2.0)),
                    child:
                        Icon(Icons.whatshot,color: Colors.red,),
                  ),
                  Container(
                    width: 3.0,
                    color: Colors.black,
                  ),
                  Column(children: <Widget>[
                    Text('HELLO'),
                    Text("ME")
                  ]),
                  Text('5',textScaleFactor: 2.0),
                  CircleAvatar(child: Icon(Icons.zoom_out_map))
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 3.0, color: Colors.black),
                      bottom: BorderSide(width: 3.0, color: Colors.black)),
                  color: bgColorBlue),
              height: 50,
              child: Center(
                child: Text('Players',style: TextStyle(color: Colors.white),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                columnWidths: {
                  0: FixedColumnWidth(50.0),
                  1: FixedColumnWidth(55.0),
                  2: FixedColumnWidth(50.0),
                },
                children: [
                  TableRow(
                    children: [
                      Container(
                        height: 290.0,
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text('.456'),
                              Text('.774'),
                              Text('78'),
                              Text('768'),
                              Text('342'),
                              Text('165'),
                              Text('25'),
                              Text('23'),
                              Text('94')
                            ]),
                      ),
                      Container(
                        color: Colors.grey[200],
                        child: Column(
                            children: versusStats
                                .map((text) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(text.cat),
                                    ))
                                .toList()),
                      ),
                      Container(
                        height: 290.0,
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text('.456'),
                              Text('.774'),
                              Text('78'),
                              Text('768'),
                              Text('342'),
                              Text('165'),
                              Text('25'),
                              Text('23'),
                              Text('94')
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
