import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:trab_4_mobile/user_model.dart';

class UserProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<UserModel> People = [];
  UserModel currentUser = new UserModel();

  UserProvider() {
    getAllPeople();
  }

  Future<void> connect(
      {required UserModel user, required Function onFail, required Function onSuccess}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: user.email, password: user.password);
      getCurrentUser();
      onSuccess();
    } on PlatformException catch (e) {
      onFail(e.message);
    }
  }

  Future<void> createNewUser(UserModel user, Function onFail, Function onSuccess) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      user.profileID = _firebaseAuth.currentUser!.uid;

      await FirebaseFirestore.instance.collection("person").add(user.toJson());

      onSuccess();
    } on PlatformException catch (e) {
      onFail(e.message);
    }
  }

  Future<void> updateUserinfo(UserModel user) async {
    var ref = FirebaseFirestore.instance.collection("person").doc(user.id);
    await ref.update(user.toJson());
  }

  void getCurrentUser() async {
    var a = _firebaseAuth.currentUser!.uid;
    currentUser = People.where((element) => element.profileID == a).first;
    People.remove(currentUser);
  }

  Future<void> getAllPeople() async {
    QuerySnapshot query = await FirebaseFirestore.instance.collection('person').get();

    query.docs.forEach((person) {
      People.add(UserModel.fromDocument(person));
    } );
  }
}
