import 'package:flutter/material.dart';
import 'package:project_ktp/Domain/entities/provinces_entities.dart';
import 'package:project_ktp/Domain/usecase/usecase_provinces.dart';
import 'package:project_ktp/Domain/usecase/usecase_regencies.dart';

class CreateChatPage extends StatefulWidget {
  const CreateChatPage({super.key});

  @override
  State<CreateChatPage> createState() => _CreateChatPageState();
}

class _CreateChatPageState extends State<CreateChatPage> {
  TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<ProvinceModel> _listProvince = [];
  final provincesUseCase = ProvincesUseCase(); // Replace 'argument' with the actual argument value.
  String _selectedProvince = '';
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Form(
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
              hintText: 'Enter your password',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (Form.of(context).validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
