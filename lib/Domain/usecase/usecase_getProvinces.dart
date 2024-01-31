import 'package:project_ktp/Data/datasource/datasource.dart';
import 'package:project_ktp/Data/repository/load_province.dart';
import 'package:project_ktp/Domain/entities/provinces_entities.dart';

class ProvincesUseCase {
  var repository = ProvinceRepository();
  Future<List<ProvinceModel>> execute() async {
    final result = await repository.loadProvince();
    return result;
  }
}
