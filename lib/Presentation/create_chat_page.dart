import 'package:flutter/material.dart';
import 'package:project_ktp/Domain/entities/provinces_entities.dart';
import 'package:project_ktp/Domain/entities/regencies_entities.dart';
import 'package:project_ktp/Domain/usecase/usecase_provinces.dart';
import 'package:project_ktp/Domain/usecase/usecase_regencies.dart';

class CreateChatPage extends StatefulWidget {
  const CreateChatPage({Key? key}) : super(key: key);

  @override
  State<CreateChatPage> createState() => _CreateChatPageState();
}

class _CreateChatPageState extends State<CreateChatPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ttlController = TextEditingController();
  TextEditingController _pekerjaanController = TextEditingController();
  TextEditingController _pendidikanController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  List<ProvinceModel> _listProvince = [];
  List<RegenciesModel> _listRegencies = [];

  final provincesUseCase =
      ProvincesUseCase(); // Replace 'argument' with the actual argument value.
  final regenciesUseCase = RegenciesUseCase();
  // Replace 'argument' with the actual argument value.
  String _selectedProvinceId = '';
  String? _selectedRegency;

  @override
  void initState() {
    super.initState();
    _fetchProvinces();
  }

  Future<void> _fetchProvinces() async {
    try {
      ProvincesUseCase provincesUseCase = ProvincesUseCase();
      List<ProvinceModel> provinces = await provincesUseCase.execute();
      setState(() {
        _listProvince = provinces;
      });
    } catch (e) {
      print("Error fetching provinces: $e");
    }
  }

  Future<void> _fetchRegencies(String id) async {
    try {
      RegenciesUseCase regenciesUseCase = RegenciesUseCase();
      List<RegenciesModel> regencies = await regenciesUseCase.execute(id);
      setState(() {
        _listRegencies = regencies;
      });
    } catch (e) {
      print("Error fetching provinces: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KTP'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Masukkan Nama Lengkap', labelText: 'Nama Lengkap'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan Nama Lengkap';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Masukkan Tanggal Lahir',
                  labelText: 'Tanggal Lahir'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan Tanggal Lahir';
                }
                return null;
              },
            ),
            DropdownButtonFormField<ProvinceModel>(
              items: _listProvince.map((province) {
                return DropdownMenuItem<ProvinceModel>(
                  value: province,
                  child: Text(province.name),
                );
              }).toList(),
              onChanged: (ProvinceModel? newValue) {
                setState(() {
                  _selectedProvinceId = newValue!.id;
                  _selectedRegency = null;
                 _fetchRegencies(_selectedProvinceId!);
                  print(newValue!.name);
                  print(newValue!.id);

                });
              },
              
               decoration: InputDecoration(
                hintText: 'Pilih Provinsi',
                labelText: 'Provinsi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<RegenciesModel>(
              items: _listRegencies.map((regency) {
                return DropdownMenuItem<RegenciesModel>(
                  value: regency,
                  child: Text(regency.name),
                );
              }).toList(),
              onChanged: (RegenciesModel? newValue) {
                setState(() {
                  _selectedRegency = newValue!.name;
                  print(newValue!.name);
                });
              },
              decoration: InputDecoration(
                hintText: 'Pilih Kota/Kabupaten',
                labelText: 'Kota/Kabupaten',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20), // Added SizedBox with height of 20
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Masukkan Pekerjaan', labelText: 'Pekerjaan'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan Pekerjaan';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Masukkan Pendidikan', labelText: 'Pendidikan'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan Pendidikan';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
