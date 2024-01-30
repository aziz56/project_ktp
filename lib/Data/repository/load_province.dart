import 'package:project_ktp/Data/datasource/datasource.dart';
import 'package:project_ktp/Domain/entities/provinces_entities.dart';
import 'package:project_ktp/Domain/entities/regencies_entities.dart';

class ProvinceRepository {
  final DataSource dataSource;

  ProvinceRepository({required this.dataSource});

  Future<List<ProvinceModel>> loadProvince() async {
    var result = await dataSource.loadProvince();
    return result; ;
  }
}
