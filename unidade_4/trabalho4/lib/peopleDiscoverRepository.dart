import 'package:trab_4_mobile/person.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IPeopleDiscoverRepository {
  void getPeople();
}

class PeopleDiscoverRepository implements IPeopleDiscoverRepository {
  PeopleDiscoverRepository();

  @override
  void getPeople() {

  }
}
