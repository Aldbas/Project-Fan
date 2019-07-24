import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogStats {
  final String cat;

  LogStats({this.cat});
}

List<LogStats> gameLogStatsCat = [
  LogStats(cat: 'Date'),
  LogStats(cat: 'Opp'),
  LogStats(cat: 'Status'),
  LogStats(cat: 'MIN'),
  LogStats(cat: 'FGM/A'),
  LogStats(cat: 'FG%'),
  LogStats(cat: 'FTM/A'),
  LogStats(cat: 'FT%'),
  LogStats(cat: '3PTM'),
  LogStats(cat: 'PTS'),
  LogStats(cat: 'REB'),
  LogStats(cat: 'AST'),
  LogStats(cat: 'ST'),
  LogStats(cat: 'BLK'),
  LogStats(cat: 'TO'),
];

List<Text> okay = gameLogStatsCat.map((text) => Text(text.cat)).toList();

final items = List<ListItem>.generate(
    11,
    (i) => i < 1
        ? HeadingItem('Heading $i')
        : MessageItem('Sender $i', 'Message body $i'));

//TODO:DO BACKEND
class PlayerGameLog extends StatefulWidget {
  @override
  _PlayerGameLogState createState() => _PlayerGameLogState();
}

class _PlayerGameLogState extends State<PlayerGameLog> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 10.0,
            dataRowHeight: 40.0,
            horizontalMargin: 5.0,
            headingRowHeight: 50.0,
            columns:
//              [
                gameLogStatsCat
                    .map((datatest) => DataColumn(
                            label: Text(
                          datatest.cat,
                          textScaleFactor: 1.5,
                        )))
                    .toList(),
            rows: [
              DataRow(cells: [
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST1')),
                DataCell(Text('TEST2')),
                DataCell(Text('TEST3')),
                DataCell(Text('TEST4')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
              ]),
              DataRow(cells: [
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST1')),
                DataCell(Text('TEST2')),
                DataCell(Text('TEST3')),
                DataCell(Text('TEST4')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
              ]),
              DataRow(cells: [
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST1')),
                DataCell(Text('TEST2')),
                DataCell(Text('TEST3')),
                DataCell(Text('TEST4')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
              ]),
              DataRow(cells: [
                DataCell(Text('TEST')),
                DataCell(Text('TEST1')),
                DataCell(Text('TEST2')),
                DataCell(Text('TEST3')),
                DataCell(Text('TEST4')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
              ]),
              DataRow(cells: [
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST1')),
                DataCell(Text('TEST2')),
                DataCell(Text('TEST3')),
                DataCell(Text('TEST4')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
                DataCell(Text('TEST')),
              ]),
            ],
          ),
        ));
  }
}

class GameLogInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
//            padding: EdgeInsets.all(1.0),
        scrollDirection: Axis.horizontal,
        itemCount: 11,
        itemBuilder: (context, index) {
          final item = items[index];

          if (item is HeadingItem) {
            return Container(
              height: 50,
              color: Colors.orange,
            );
          } else if (item is MessageItem) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.limeAccent,
                  border: Border.all(color: Colors.white)),
              width: 100,
              child: Row(
                children: okay,
              ),
            );
          }
          return Container();
        });
  }
}

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
