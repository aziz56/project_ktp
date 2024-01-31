// File: get_person_usecase.dart
import 'package:project_ktp/Data/repository/person_repository.dart';
import 'package:project_ktp/Domain/entities/person_entities.dart';

class GetPersonUseCase {
  final PersonRepository repository;

  GetPersonUseCase({required this.repository});

  Future<List<PersonEntity>> execute() async {
    return await repository.getPersons();
  }
}