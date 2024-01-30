import 'package:project_ktp/Data/datasource/datasource.dart';
import 'package:project_ktp/Domain/entities/regencies_entities.dart';

class RegencyRepository {
  final DataSource dataSource;

  RegencyRepository({required this.dataSource});

  Future<List<RegenciesModel>> loadRegencies() async {
    final result = await dataSource.loadRegencies();
    return result;
  }
}