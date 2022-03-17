import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'peopleDiscover.dart';
import 'placesDiscover.dart';
import 'profilePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save The Date"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            "Seja Bem vindo!\nAqui você conhecerá novas pessoas e lugares legais nas proximidades!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontFamily: "Times New Roman",
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 30.0,
          ),
          new TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => profilePage(),
                  ));
            },
            style: TextButton.styleFrom(
              primary: Colors.black,
              backgroundColor: Colors.tealAccent,
            ),
            child: Text(
              "Acessar meu perfil",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          new TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => peopleDiscover(),
                  ));
            },
            style: TextButton.styleFrom(
              primary: Colors.black,
              backgroundColor: Colors.tealAccent,
            ),
            child: Text(
              "Descobrir Pessoas",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          new TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => placesDiscover(),
                  ));
            },
            style: TextButton.styleFrom(
              primary: Colors.black,
              backgroundColor: Colors.tealAccent,
            ),
            child: Text(
              "Descobrir Lugares",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
