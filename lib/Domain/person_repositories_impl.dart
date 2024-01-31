// File: person_repository_impl.dart
import 'package:project_ktp/Data/datasource/local_datasource.dart';
import 'package:project_ktp/Data/repository/person_repository.dart';
import 'package:project_ktp/Domain/entities/person_entities.dart';
import 'package:project_ktp/Domain/entities/person_hive_model.dart';


class PersonRepositoryImpl implements PersonRepository {
  final HiveDataSource hiveDataSource;

  PersonRepositoryImpl({required this.hiveDataSource});

  @override
  Future<void> savePerson(PersonEntity person) async {
    final hiveModel = PersonHiveModel()
      ..name = person.name
      ..birthDate = person.birthDate
      ..province = person.province
      ..regency = person.regency
      ..occupation = person.occupation
      ..education = person.education;

    await hiveDataSource.savePerson(hiveModel);
  }

  @override
  Future<List<PersonEntity>> getPersons() async {
    final hivePersons = await hiveDataSource.getPersons();
    return hivePersons.map((hivePerson) => PersonEntity(
      name: hivePerson.name,
      birthDate: hivePerson.birthDate,
      province: hivePerson.province,
      regency: hivePerson.regency,
      occupation: hivePerson.occupation,
      education: hivePerson.education,
    )).toList();
  }

  @override
  Future<void> updatePerson(PersonEntity person) async {
    final hiveModel = PersonHiveModel()
      ..name = person.name
      ..birthDate = person.birthDate
      ..province = person.province
      ..regency = person.regency
      ..occupation = person.occupation
      ..education = person.education;

    await hiveDataSource.updatePerson(hiveModel);
  }

  @override
  Future<void> deletePerson(int key) async {
    await hiveDataSource.deletePerson(key);
  }
}