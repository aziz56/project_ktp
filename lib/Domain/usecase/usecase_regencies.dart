import 'package:project_ktp/Data/repository/load_regencies.dart';
import 'package:project_ktp/Domain/entities/regencies_entities.dart';

class RegenciesUseCase {
  final RegencyRepository repository;

  RegenciesUseCase({required this.repository});
    Future<List<RegenciesModel>> execute() async {
    final result = await repository.loadRegencies();
    return result;

}
}