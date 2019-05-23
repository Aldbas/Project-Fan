import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'tableversion.dart';

import 'listtile.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScrollController _controller;
  List<Categories> categories;
  List<Categories> selectedCategories;
  bool sort;

  @override
  void initState() {
    sort = false;
    selectedCategories = [];
    categories = Categories.getCat();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  Color clr = Colors.lightGreen;
  _scrollListener() {
    if (_controller.offset > _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        clr = Colors.red;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        clr = Colors.lightGreen;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> testCat = [
      'FGM/A',
      'FG%',
      'FTM/A',
      'FT%',
      '3PTM',
      'PTS',
      'REB',
      'STL',
      'AST',
      'BLK',
      'TO',
    ];

    List<Widget> widgets = testCat
        .map((testCat) => Text(testCat,
            style: TextStyle(fontSize: 11.0, color: Colors.indigo)))
        .toList();
//    double width = MediaQuery.of(context).size.width;
//    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Fan',
      home: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.blue[900],
                  expandedHeight: 150,
                  pinned: true,
//                  floating: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.home),
                        Text(
                          'League NAME',
                        ),
                        Icon(Icons.message)
                      ],
                    ),
                    centerTitle: true,
                    title: Text('TEAM NAME'),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    minHeight: 30,
                    maxHeight: 30,
                    child: Container(
                      height: 30,
                      color: Colors.blue[900],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: categories
                            .map((categories) => Text(
                                  categories.cat,
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.white,

//                                    fontWeight: FontWeight.bold
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  pinned: true,
                )
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
//                  Container(
//                    height: 30,
//                    color: Colors.blue[900],
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      children: categories
//                          .map((categories) => Text(
//                                categories.cat,
//                                style: TextStyle(
//                                  fontSize: 13.0,
//                                  color: Colors.white,
//
////                                    fontWeight: FontWeight.bold
//                                ),
//                              ))
//                          .toList(),
//                    ),
//                  ),
                  Card(
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              'PG,SG' +
                                  ' -Den\n'
                                      'L 90-95 v WAS',
                              style: TextStyle(fontSize: 12.0)),
                        ],
                      ),
                      leading: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.red,
                          ),
                          Text(
                            'J. Murray',
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
//                  title: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      Text(
//                        'FGM/A',
//                        style: TextStyle(fontSize: 11.0, color: Colors.red),
//                      ),
//                      Text(
//                        'FG%',
//                        style: TextStyle(fontSize: 11.0),
//                      ),
//                      Text(
//                        'FTM/A',
//                        style: TextStyle(fontSize: 11.0),
//                      ),
//                      Text(
//                        ' FT%',
//                        style: TextStyle(fontSize: 11.0),
//                      ),
//                      Text(
//                        '3PTM',
//                        style: TextStyle(fontSize: 11.0),
//                      ),
//                      Text(
//                        'PTS',
//                        style: TextStyle(fontSize: 11.0),
//                      ),
//                      Text(
//                        'REB',
//                        style: TextStyle(fontSize: 11.0),
//                      ),
//                      Text(
//                        'AST',
//                        style: TextStyle(fontSize: 11.0),
//                      ),
//                      Text(
//                        'STL',
//                        style: TextStyle(fontSize: 11.0),
//                      ),
//                      Text(
//                        'BLK',
//                        style: TextStyle(fontSize: 11.0),
//                      ),
//                      Text(
//                        'TO',
//                        style: TextStyle(fontSize: 11.0),
//                      ),
//                    ],
//                  ),
                  ),
                  Card(
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                          ),
                        ],
                      ),
                      leading: CircleAvatar(child: Text('PG')),
                      subtitle: Table(children: [
                        TableRow(children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 0.2))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '54/75',
                                  style: TextStyle(
                                      fontSize: 11.0, color: Colors.grey),
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
                        ]),
                      ]),
                    ),
                  ),
                  Container(
                    height: 80,
                    child: Card(
                      child: GridTile(
                        child: Text(''),
                        header: CircleAvatar(),
                        footer: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text('SG'),
                                Icon(Icons.build),
                                Text('Hello'),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(width: 0.3),
                                      bottom: BorderSide(width: 0.3))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '54/75',
                                    style: TextStyle(
                                        fontSize: 11.0, color: Colors.red),
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
                          ],
                        ),
//                    leading: CircleAvatar(
//                      child: Text('PG'),
//                      backgroundColor: Colors.red,
//                    ),
//                    subtitle:
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Hello'),
                      leading: CircleAvatar(
                        child: Text('PG'),
                        backgroundColor: Colors.red,
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                  Container(
                    height: 70,
//                    width: 50,
                    child: Card(
                      child: GridTile(
                        header: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
//                            Text('SF'),
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'J. Burnson' +
                                    ' Dal - PG\n'
                                        'W 105-102 @OKC',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            )
                          ],
                        ),
                        child: Text(''),
                        footer: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '54/75',
                              style:
                                  TextStyle(fontSize: 11.0, color: Colors.red),
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
                  ),
                  Container(
                    height: 90,
                    child: Card(
                      child: GridTile(
                        child: Text(''),
                        header: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(backgroundColor: Colors.transparent),
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
                        ),
                        footer: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '54/75',
                              style:
                                  TextStyle(fontSize: 11.0, color: Colors.red),
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
                  ),
                  Container(
                    height: 85,
                    child: Card(
                      child: GridTile(
                        child: Text(''),
                        header: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(backgroundColor: Colors.transparent),
                              CircleAvatar(
                                radius: 30.0,
                                backgroundColor: Colors.transparent,
                                child: Image.network(
                                    'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/6585.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'A. Drummond' +
                                      ' Det - PF,C\n'
                                          'L 60-90 v LAL',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              )
                            ],
                          ),
                        ),
                        footer: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '54/75',
                              style:
                                  TextStyle(fontSize: 11.0, color: Colors.red),
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
                  ),
                  Container(
                    height: 80,
                    child: Card(
                      child: GridTile(
                        child: Text(''),
                        header: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(backgroundColor: Colors.transparent),
                              CircleAvatar(
                                radius: 28.0,
                                backgroundColor: Colors.transparent,
                                child: Image.network(
                                    'http://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4066336.png&w=350&h=254'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'L. Markkanen' +
                                      ' Chi - PF\n'
                                          'No Game',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              )
                            ],
                          ),
                        ),
                        footer: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '-',
                              style:
                                  TextStyle(fontSize: 11.0, color: Colors.red),
                            ),
                            Text(
                              '-',
                              style: TextStyle(fontSize: 11.0),
                            ),
                            Text(
                              '-',
                              style: TextStyle(fontSize: 11.0),
                            ),
                            Text(
                              '-',
                              style: TextStyle(fontSize: 11.0),
                            ),
                            Text(
                              '-',
                              style: TextStyle(fontSize: 11.0),
                            ),
                            Text(
                              '-',
                              style: TextStyle(fontSize: 11.0),
                            ),
                            Text(
                              '-',
                              style: TextStyle(fontSize: 11.0),
                            ),
                            Text(
                              '-',
                              style: TextStyle(fontSize: 11.0),
                            ),
                            Text(
                              '-',
                              style: TextStyle(fontSize: 11.0),
                            ),
                            Text(
                              '-',
                              style: TextStyle(fontSize: 11.0),
                            ),
                            Text(
                              '-',
                              style: TextStyle(fontSize: 11.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),

//          body: CollapsingList()
//        CustomScrollView(
////          scrollDirection: Axis.vertical,
//          slivers: <Widget>[
//            SliverAppBar(
//              expandedHeight: 150.0,
//              floating: false,
//              pinned: true,
//              backgroundColor: Colors.orange,
//              centerTitle: true,
//              title: Text('Team Name'),
//              flexibleSpace: FlexibleSpaceBar(
//                background: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Icon(Icons.home),
//                    Text('TeamName'),
//                    Icon(Icons.message),
//                  ],
//                ),
//              ),
//            ),
//            CollapsingList()
//          ],
//        ),
//        body: NestedScrollView(
//          headerSliverBuilder: (BuildContext context, bool innerBoxIsSelected) {
//            return <Widget>[
//              SliverAppBar(
//                expandedHeight: 150.0,
//                floating: false,
//                pinned: true,
//                backgroundColor: Colors.orange,
//                flexibleSpace: FlexibleSpaceBar(
//                  centerTitle: true,
//                  background: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      Icon(Icons.home),
//                      Text('League Name'),
//                      GestureDetector(
//                          onTap: () => print('Home'),
//                          child: Icon(Icons.home, color: Colors.white)),
//                    ],
//                  ),
//                  title: Text('Team Name'),
//                ),
//              ),
//              SliverPersistentHeader(
//                delegate: _SliverAppBarDelegate(
//                    collapsedHeight: 60.0, expandedHeight: 60.0),
//                pinned: true,
//              )
//            ];
//          },
//          body:,
//        ),
    );
  }
}

//class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//  _SliverAppBarDelegate(
//      {@required this.collapsedHeight, @required this.expandedHeight});
//
//  final double collapsedHeight;
//  final double expandedHeight;
////  final Container _container;
//
//  @override
//  double get minExtent => collapsedHeight;
//
//  @override
//  double get maxExtent => math.max(expandedHeight, minExtent);
//
//  @override
//  Widget build(
//      BuildContext context, double shrinkOffset, bool overlapsContent) {
//    return Container(
//      color: Colors.blueAccent,
//      height: 300,
//      child: Column(
//        children: <Widget>[
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Text('FGM/A'),
//              Text('FG%'),
//              Text('FTM/A'),
//              Text('FT%'),
//              Text('3PTM'),
//              Text('PTS'),
//              Text('REB'),
//              Text('AST'),
//              Text('STL'),
//              Text('BLK'),
//              Text('TO'),
//            ],
//          ),
//        ],
//      ),
//    );
//  }
//
//  @override
//  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//    return false;
//  }
//}

class CollapsingList extends StatelessWidget {
  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 100.0,
        maxHeight: 200.0,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[Icon(Icons.home), Icon(Icons.message)],
          ),
          color: Colors.deepOrange,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        makeHeader('Header Section 1'),
        SliverFixedExtentList(
          itemExtent: 100.0,
          delegate: SliverChildListDelegate(
            [
              Container(color: Colors.red),
              Container(color: Colors.purple),
              Container(color: Colors.green),
              Container(color: Colors.orange),
              Container(color: Colors.yellow),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('Test'),
              ),
              ListTile(
                subtitle: Text('Test Subtitle'),
                leading: Text('Leading'),
              )
            ],
          ),
        ),

//        makeHeader('Header Section 4'),
//        // Yes, this could also be a SliverFixedExtentList. Writing
//        // this way just for an example of SliverList construction.
//        SliverList(
//          delegate: SliverChildListDelegate(
//            [
//              Container(color: Colors.pink, height: 150.0),
//              Container(color: Colors.cyan, height: 150.0),
//              Container(color: Colors.indigo, height: 150.0),
//              Container(color: Colors.blue, height: 150.0),
//            ],
//          ),
//        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(height: 30, child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
//      maxHeight != oldDelegate.maxHeight ||
//        minHeight != oldDelegate.minHeight ||
//        child != oldDelegate.child;
  }
}
