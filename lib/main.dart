import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:project_fan/home_page.dart';

import 'model/playerInfo.dart';
import 'team_roster_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(PlayerInfoAdapter());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.orange,
      debugShowCheckedModeBanner: false,
      title: 'Project Fan',
      home: FutureBuilder(
          future: Future.wait([Hive.openBox('Players'), Hive.openBox('AllPlayers')]),
          builder: (context,snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              if(snapshot.hasError)
                return Text(snapshot.hasError.toString());
              else return HomePage();
            }
            else return Scaffold();
      }),
      routes: {
        'HomePage': (context) => HomePage(),
        'TeamRosterPage': (context) => TeamRosterPage(),
      },
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
