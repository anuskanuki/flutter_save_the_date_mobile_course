import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({this.email = "", this.password = "", this.name = ""});

  UserModel.fromDocument(DocumentSnapshot document) {
    this.id = document.id;
    this.name = document['name'] as String;
    this.email = document['email'] as String;
    this.bio = document['bio'] as String;
    this.contact = document['contact'] as String;

    // print(document.data().keys);
    this.profileID = document['profileID'] as String;

    if (document.get('image') != null) {
      this.img = document['image'];
    }

    age = DateTime.now().year - (document['birthday'] as Timestamp).toDate().year;
  }

  String id = '';
  String profileID = '';
  String name = '';
  String email = '';
  String password = '';
  String bio = '';
  String confirmPassword = '';
  String img = '';
  String contact = '';
  DateTime birthday = new DateTime(1, 1, 1);
  int age = 0;

  Map<String, dynamic> toJson() => {
    'profileID': profileID,
    'name': name,
    'email': email,
    'bio': bio,
    'contact': contact,
    'birthday': birthday,
    'image': img,
  };
}
