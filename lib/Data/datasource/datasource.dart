import 'dart:async';
import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:project_ktp/Domain/entities/provinces_entities.dart';
import 'package:project_ktp/Domain/entities/regencies_entities.dart';

class DataSource {
  Future<String> loadProvince() async {
    var provinceToLoad = await rootBundle.loadString('assets/provinces.json');
    provinceModelFromJson(provinceToLoad);
    return provinceToLoad;
  }
  Future<String> loadRegencies() async {
    var regencyToLoad = await rootBundle.loadString('assets/regencies.json');
    regenciesModelFromJson(regencyToLoad);
    return regencyToLoad;
  }
}
