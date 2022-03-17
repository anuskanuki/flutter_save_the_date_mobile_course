import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:trab_4_mobile/UserProvider.dart';
import 'package:trab_4_mobile/peopleDiscoverController.dart';
import 'package:trab_4_mobile/person.dart';
import 'package:trab_4_mobile/personCard.dart';
import 'package:async/async.dart';

class peopleDiscover extends StatefulWidget {
  List<Person> people = [];
  bool passou = false;

  peopleDiscover();

  @override
  _peopleDiscoverState createState() => _peopleDiscoverState();
}

class _peopleDiscoverState extends State<peopleDiscover> {
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  late PeopleDiscoverController controller;

  List<SwipeItem> swipeItems = List.empty(growable: true);
  late MatchEngine matchEngine;

  bool hasPeople = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (hasPeople) {
      return _buildScaffold(_buildConsumer());
    } else {
      return _buildScaffold(_emptyPeopleMessage());
    }
  }

  Widget _buildConsumer() {
    return Consumer<UserProvider>(
        builder: (_, userProvider, __) {
          userProvider.People.forEach((person) {
            swipeItems.add(SwipeItem(content: personCard(person)));
          });

          return SwipeCards(
            matchEngine: MatchEngine(
              swipeItems: swipeItems,
            ),
            onStackFinished: () {
              setState(() {
                hasPeople = false;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                child: swipeItems[index].content,
              );
            },
          );
        }
    );
  }

  Widget _buildScaffold(Widget child) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Descobrir pessoas"),
      ),
      body: child,
    );
  }

  Widget _emptyPeopleMessage() {
    return Center(
      child: Container(
        child: Text(
          "Não há mais pessoas para mostrar",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
