import 'package:flutter/material.dart';

import 'home_page.dart';

class Standings extends StatelessWidget {

  List<String> standHeadings = ['Rank', 'Team', 'W-T-L', 'GB'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColorBlue,
        centerTitle: true,
        title: Text('BEST LEAGUE'),
        actions: [
          FlatButton(
            textColor: Colors.white,
            disabledColor: Colors.red,
            child: Icon(Icons.settings),
            onPressed: () => print('LeagueSettings'),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Card(
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
                DataTable(
                    columnSpacing: 35.0,
                    dataRowHeight: 40.0,
                    columns: standHeadings
                        .map((columnHeadings) => DataColumn(
                                label: Text(
                              columnHeadings,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            )))
                        .toList(),
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('TeamName')),
                        DataCell(Text('10-2-4')),
                        DataCell(Text('2')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('3')),
                        DataCell(Text('SupremeTeam')),
                        DataCell(Text('hello2')),
                        DataCell(Text('0')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('8')),
                        DataCell(Text('ImtryingJennifer')),
                        DataCell(Text('1-0-14')),
                        DataCell(Text('4')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('2')),
                        DataCell(Text('3isTheyKey')),
                        DataCell(Text('14-1-1')),
                        DataCell(Text('1')),
                      ]),
                    ])
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text('Standings',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold)),
                    Text('View Details >')
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: {
                    0: FixedColumnWidth(75.0),
                    1: FixedColumnWidth(150.0),
                    2: FixedColumnWidth(100.0),
                    3: FixedColumnWidth(50.0)
                  },
                  children: [
                    TableRow(
                        children: standHeadings
                            .map((text) => Text(
                                  text,
                                  style: TextStyle(fontSize: 20.0),
                                ))
                            .toList()),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[Text('7'), Icon(Icons.ac_unit)],
                        ),
                      ),
                      Text('Buckets'),
                      Text('5-0-9'),
                      Text('0')
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text('4'),
                            Icon(Icons.access_alarm)
                          ],
                        ),
                      ),
                      Text('aRealLongName'),
                      Text('5-2-5'),
                      Text('3')
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text('5'),
                            Icon(Icons.add_location)
                          ],
                        ),
                      ),
                      Text(
                        'HARDinDAPAINT',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text('6-2-7'),
                      Text('4')
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text('6 '),
                            Icon(
                              Icons.zoom_out_map,
                            )
                          ],
                        ),
                      ),
                     FlatButton(
                          onPressed: () => print('takes you to rosterpage'),
                          child: Text(
                            'zoomBoom',
                            textAlign: TextAlign.start,
                          )),
                      Text('2-1-9'),
                      Text('2')
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

