import 'package:flutter/material.dart';
import 'package:trab_4_mobile/person.dart';
import 'package:trab_4_mobile/user_model.dart';

class personCard extends StatelessWidget {
  final UserModel person;
  const personCard(this.person);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            _buildGradientBackground(),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.cyan, Colors.tealAccent]),
      ),
      child: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              _buildCircleAvatar(),
              SizedBox(
                height: 10.0,
              ),
              _buildHeaderInfo(person.name),
              _buildHeaderInfo("${person.age} anos"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircleAvatar() {
    var image = person.img.isEmpty ? "https://www.allianceplast.com/wp-content/uploads/2017/11/no-image.png" : person.img;

    return CircleAvatar(
      backgroundImage: NetworkImage(
        image,
      ),
      radius: 50.0,
    );
  }

  Widget _buildHeaderInfo(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 22.0,
        color: Colors.black,
      ),
    );
  }

  Widget _buildBodyInfo(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bio:",
            style: TextStyle(color: Colors.tealAccent, fontSize: 28.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          _buildBodyInfo(person.bio),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Contato:",
            style: TextStyle(color: Colors.tealAccent, fontSize: 28.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          _buildBodyInfo(person.contact),
        ],
      ),
    );
  }
}
