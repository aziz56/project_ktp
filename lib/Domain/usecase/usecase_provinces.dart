import 'package:project_ktp/Data/repository/load_province.dart';
import 'package:project_ktp/Domain/entities/provinces_entities.dart';

class LoadProvincesUseCase {
  final ProvinceRepository repository;

  LoadProvincesUseCase({required this.repository});

  Future<List<ProvinceModel>> execute() async {
    final result = await repository.loadProvince();
    return result;
  }
}
