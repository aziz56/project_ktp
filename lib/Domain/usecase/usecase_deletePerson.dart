import 'package:project_ktp/Data/repository/person_repository.dart';
import 'package:project_ktp/Domain/entities/person_entities.dart';

class UpdatePersonUseCase {
  final PersonRepository repository;

  UpdatePersonUseCase({required this.repository});

  Future<void> execute(PersonEntity person) async {
    await repository.updatePerson(person);
  }
}