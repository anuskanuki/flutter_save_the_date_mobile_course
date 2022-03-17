import 'package:trab_4_mobile/peopleDiscoverRepository.dart';
import 'package:trab_4_mobile/person.dart';

class PeopleDiscoverController {
  List<Person> people = List.empty(growable: true);

  late PeopleDiscoverRepository _repository;

  PeopleDiscoverController() {
    _repository = PeopleDiscoverRepository();
  }

  Future<void> getPeopleFromDatabase() async {

  }
}
