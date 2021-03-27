import 'package:flutter/material.dart';
import 'package:hello_flutter/lorem_picsum.dart';
import 'package:hello_flutter/space_flight.dart';

enum Actions {
  profile,
  settings,
  loremPicsum,
  space
}

class Dashboard extends StatelessWidget {
  final String email;

  const Dashboard({@required this.email}) : assert(email != null);

  Widget _card(BuildContext context, String title, IconData icon, Actions action) {
    return GestureDetector(
      onTap: () {
        switch(action) {
          case Actions.profile:
            print("Go to profile");
            break;
          case Actions.settings:
            print("Go to settings");
            break;
          case Actions.loremPicsum:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoremPicsum())
            );
            break;
          case Actions.space:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SpaceFlightNews())
            );
            break;
        }
      },
      child: Container(
          color: Colors.teal[300],
          padding: const EdgeInsets.all(8),
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(icon, size: 64.0),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 22),
              ),
            )
          ]
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "login",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Dashboard"),
          ),
          body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget> [
              _card(context, "Profile", Icons.person, Actions.profile),
              _card(context, "Settings", Icons.settings, Actions.settings),
              _card(context, "Lorem Picsum", Icons.image, Actions.loremPicsum),
              _card(context, "Space Flight", Icons.airplanemode_on, Actions.space),
            ],
          )
      ),
    );
  }
}
