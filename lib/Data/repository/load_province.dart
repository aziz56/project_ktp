import 'package:project_ktp/Data/datasource/datasource.dart';
import 'package:project_ktp/Domain/entities/provinces_entities.dart';
import 'package:project_ktp/Domain/entities/regencies_entities.dart';

class ProvinceRepository {
  var dataSource = DataSource();
  Future<List<ProvinceModel>> loadProvince() async {
    var result = await dataSource.loadProvince();
    var province = provinceModelFromJson(result);
    return province;
  }
}
