
import 'package:project_ktp/Domain/entities/person_entities.dart';

abstract class PersonRepository {
  Future<void> savePerson(PersonEntity person);
  Future<List<PersonEntity>> getPersons();
  Future<void> updatePerson(PersonEntity person);
  Future<void> deletePerson(int key);
}