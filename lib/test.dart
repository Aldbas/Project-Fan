import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  final List<Players> players;
  Test({this.players});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Card(child: Text(players[index].name),

      );
    });
  }
}

class Players {
  final String name;

  Players({this.name});

  factory Players.fromJson(Map<String, dynamic> json) {
    return Players(
      name: json['name'],
    );
  }

}