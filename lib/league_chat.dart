import 'package:flutter/material.dart';

import 'home_page.dart';

class LeagueChatPage extends StatefulWidget {
  @override
  _LeagueChatPageState createState() => _LeagueChatPageState();
}

class _LeagueChatPageState extends State<LeagueChatPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: bgColorBlue,
            centerTitle: true,
            title: Text('Leage Chat'),
            bottom: TabBar(
                tabs: [Tab(text: 'Chats'),
                  Tab(text: 'Leagues',)
              ]),
        ),
        body: TabBarView(
          children: <Widget>[
            Text('CHATS'), //TODO create Chats Page
            Text('LEAGUES'), // TODO Leagues chat page
          ],
        )
      )
    );
  }
}
