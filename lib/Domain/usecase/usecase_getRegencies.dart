import 'package:project_ktp/Data/repository/load_regencies.dart';
import 'package:project_ktp/Domain/entities/regencies_entities.dart';

class RegenciesUseCase {
  var repository = RegencyRepository();
    Future<List<RegenciesModel>> execute(String id) async {
    final result = await repository.loadRegencies(id);
    return result;

}
}