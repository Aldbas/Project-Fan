import 'package:flutter/material.dart';

class PlayerStats extends StatefulWidget {
  @override
  _PlayerStatsState createState() => _PlayerStatsState();
}

class _PlayerStatsState extends State<PlayerStats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 10.0,
          columns: [
            DataColumn(label: Text('Season (avg)')),
            DataColumn(label: Text('Rank')),
            DataColumn(label: Text('FGM/A')),
            DataColumn(label: Text('FG%')),
            DataColumn(label: Text('FTM/A')),
            DataColumn(label: Text('FT%')),
            DataColumn(label: Text('3PTM')),
            DataColumn(label: Text('PTS')),
            DataColumn(label: Text('REB')),
            DataColumn(label: Text('AST')),
            DataColumn(label: Text('STL')),
            DataColumn(label: Text('BLK')),
            DataColumn(label: Text('TO')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('2018 Season')),
              DataCell(Text('500')),
              DataCell(Text('6.5/14.3')),
              DataCell(Text('.456')),
              DataCell(Text('2.3/3.5')),
              DataCell(Text('.856')),
              DataCell(Text('.1')),
              DataCell(Text('12.4')),
              DataCell(Text('6.7')),
              DataCell(Text('1.4')),
              DataCell(Text('.6')),
              DataCell(Text('.8')),
              DataCell(Text('4.2')),
            ]),
            DataRow(cells: [
              DataCell(Text('2017 Season ')),
              DataCell(Text('725')),
              DataCell(Text('4.5/6.5')),
              DataCell(Text('.456')),
              DataCell(Text('2.3/3.5')),
              DataCell(Text('.856')),
              DataCell(Text('0')),
              DataCell(Text('12.4')),
              DataCell(Text('6.7')),
              DataCell(Text('1.4')),
              DataCell(Text('.6')),
              DataCell(Text('.8')),
              DataCell(Text('4.2')),
            ]),
          ],
        ),
      ),
    );
  }
}
