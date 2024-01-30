import 'dart:async';
import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:project_ktp/Domain/entities/provinces_entities.dart';
import 'package:project_ktp/Domain/entities/regencies_entities.dart';

class DataSource {
  Future<List<ProvinceModel>> loadProvince() async {
    var provinceToLoad = await rootBundle.loadString('assets/provinces.json');
    return provinceModelFromJson(provinceToLoad);
  }

  Future<List<RegenciesModel>> loadRegencies() async {
    var regencyToLoad = await rootBundle.loadString('assets/regencies.json');
    return regenciesModelFromJson(regencyToLoad);
  }
}
