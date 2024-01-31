import 'package:project_ktp/Data/datasource/datasource.dart';
import 'package:project_ktp/Domain/entities/regencies_entities.dart';

class RegencyRepository {
  var dataSource = DataSource();


  Future<List<RegenciesModel>> loadRegencies(String id) async {
    var result = await dataSource.loadRegencies();
    var regencyJson = regenciesModelFromJson(result);
    var getRegency = regencyJson.where((regency) => regency.provinceId == id).toList();
    return getRegency;
  }
}
