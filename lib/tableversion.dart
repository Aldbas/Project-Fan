import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TableData extends StatelessWidget {
  List<Categories> categories;
  List<Categories> selectedCategories;

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortColumnIndex: 0,
        columns: [
          DataColumn(label: Text('FGM/A')),
          DataColumn(label: Text('FG%')),
          DataColumn(label: Text('FGM/A')),
          DataColumn(label: Text('FGM/A')),
          DataColumn(label: Text('FGM/A')),
          DataColumn(label: Text('FGM/A')),
          DataColumn(label: Text('FGM/A')),
          DataColumn(label: Text('FGM/A')),
          DataColumn(label: Text('FGM/A')),
          DataColumn(label: Text('FGM/A')),
          DataColumn(label: Text('FGM/A')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('Goodbye')),
            DataCell(Text("Hello")),
            DataCell(Text("Hello")),
            DataCell(Text("Hello")),
            DataCell(Text("Hello")),
            DataCell(Text("Hello")),
            DataCell(Text("Hello")),
            DataCell(Text("Hello")),
            DataCell(Text("Hello")),
            DataCell(Text("Hello")),
            DataCell(Text("Hello")),
          ]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: dataBody());
  }
}

class NonDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(border: TableBorder.all(),
//        defaultVerticalAlignment: TableCellVerticalAlignment,
        columnWidths: const <int, TableColumnWidth>{
//          0: FixedColumnWidth(55.0),
//          1: FixedColumnWidth(35.0),
//          2: FixedColumnWidth(45.0),
//          3: FixedColumnWidth(35.0),
//          4: FixedColumnWidth(42.0),
        },
//        defaultColumnWidth: const FixedColumnWidth(36.0),
        children: [
          TableRow(children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.bottom,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
//              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'FGM/A',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'FG%',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'FTM/A',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'FT%',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    '3PTM',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'PTS',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'REB',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'AST',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'STL',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'BLK',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'TO',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ]),
          TableRow(children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.bottom,
              child: Row(
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
          ])
        ]);
  }
}

class Categories {
  String cat;

  Categories({this.cat});

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
