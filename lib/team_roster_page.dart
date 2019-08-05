import 'package:flutter/material.dart';

import 'home_page.dart';
import 'players_profile.dart';
import 'playertile.dart';

import 'dart:math' as math;

//TODO: CLEAN UP CODE
//TODO:FIND WAY TO GET PLAYER STATS
//TODO:CREATE A WAY TO SHOW 'PLAYED ALREADY'
//TODO:Create player page when tapped
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
List<Categories> categories;
List<Categories> selectedCategories;

//  bool sort;
class TeamRosterPage extends StatefulWidget {
  @override
  _TeamRosterPageState createState() => _TeamRosterPageState();
}

class _TeamRosterPageState extends State<TeamRosterPage> {
//TODO WHAT IS HAPPENING IN THIS CODE BELOW

  @override
  void initState() {
//    sort = false;
    selectedCategories = [];
    categories = Categories.getCat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = testCat
        .map((testCat) => Text(testCat,
            style: TextStyle(fontSize: 11.0, color: Colors.indigo)))
        .toList();
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.black,
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: bgColorBlue,
                  expandedHeight: 150,
                  pinned: true,
//                  floating: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                       Text('Sat, Mar 30',style: TextStyle(color: Colors.white),),
                        Text(
                          'BEST LEAGUE',
                          style: TextStyle(color: Colors.white),
                        ),IconButton(
                          icon: Icon(Icons.settings),
                          color: Colors.white,
                          onPressed: () => print('Team Settings'))
                      ],
                    ),
                    centerTitle: true,
                    title: Text('TEAM NAME'),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    minHeight: 70,
                    maxHeight: 70,
                    child: Container(
                      height: 70,
                      color: Colors.blue[900],
                      child: Column(
//                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Players',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                          Divider(),
                          Row(
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
                        ],
                      ),
                    ),
                  ),
                  pinned: true,
                )
              ];
            },
            body: ListView.builder(
                padding: EdgeInsets.all(0.0),
                itemCount: setPosition.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                  setPosition: setPosition[index])));
                    },
                    child: GridTilePosition(
                      position: setPosition[index],
                    ),
                  );
                })),
      ),
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
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
//        maxHeight != oldDelegate.maxHeight ||
//            minHeight != oldDelegate.minHeight ||
//            child != oldDelegate.child;
  }
}
