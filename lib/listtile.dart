import 'package:flutter/material.dart';
import 'tableversion.dart';

class LisTileVersion extends StatefulWidget {
  @override
  _LisTileVersionState createState() => _LisTileVersionState();
}

class _LisTileVersionState extends State<LisTileVersion> {
  List<Categories> categories;
  var list = ["one", "two", "three", "four"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Categories.getCat().length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(leading: Text(categories.toString()));
      },
    );
  }

  List<Widget> createChildrenText() {
    return list.map((text) => Text(text)).toList();
  }
}

class CustomListTile extends ListTile {
//  CustomListTile{()}
}
