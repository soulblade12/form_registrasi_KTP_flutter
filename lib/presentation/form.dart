import 'package:flutter/material.dart';
import 'package:form_registrasi_ktp/data/model/user_data.dart';
import 'package:go_router/go_router.dart';
import 'package:form_registrasi_ktp/data/datasource.dart';
import 'package:form_registrasi_ktp/domain/entities/provinsi.dart';
import 'package:form_registrasi_ktp/domain/entities/kabupaten.dart';
import 'package:hive_flutter/hive_flutter.dart';

// class FormModel extends ChangeNotifier {}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  TextEditingController _nama = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _kabupaten = TextEditingController();
  TextEditingController _provinsi = TextEditingController();
  TextEditingController _pekerjaan = TextEditingController();
  TextEditingController _pendidikan = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  List<Province> provinces = [];
  List<Kabupaten> kabupatenList = [];
  @override
  void initState() {
    super.initState();
    loadProvincelist();
  }

  Future<List<Province>> loadProvincelist() async {
    List<Province> loadedProvinces = await loadProvince();
    setState(() {
      provinces = loadedProvinces;
    });
    return provinces;
  }

  Future<void> updateKabupatenList(String selectedProvinceId) async {
    List<Kabupaten> loadedKabupaten = await loadKabupaten(selectedProvinceId);
    setState(() {
      kabupatenList = loadedKabupaten;
    });
  }

  Future<void> saveToHive() async {
    final userDataBox = await Hive.openBox<UserData>('userDataBox');
    final userData = UserData(
      nama: _nama.text,
      dob: _dob.text,
      provinsi: _provinsi.text,
      kabupaten: _kabupaten.text,
      pekerjaan: _pekerjaan.text,
      pendidikan: _pendidikan.text,
    );

    userDataBox.add(userData).then((value) {
      if (value >= 0) {
        // Successfully added to Hive
        print(userData);
        print('Data added to Hive with key: $value');
      } else {
        // Failed to add to Hive
        print('Failed to add data to Hive');
      }
    });
  }

  // List<String> pekerjaanList = ['Provinsi 1', 'Provinsi 2', 'Provinsi 3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form KTP")),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                controller: _nama,
                decoration: const InputDecoration(
                    labelText: "nama lengkap", border: OutlineInputBorder()),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "enter some text bro";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                autofocus: true,
                controller: _dob,
                decoration: const InputDecoration(
                    labelText: "Tempat Tanggal Lahir",
                    border: OutlineInputBorder()),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "enter some text bro";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 12,
              ),
              DropdownButtonFormField<String>(
                value: provinces.isNotEmpty ? provinces[0].name : '',
                onChanged: (String? value) {
                  _provinsi.text = value!;
                  updateKabupatenList(
                      provinces.firstWhere((p) => p.name == value).id);
                },
                items: provinces.map((Province province) {
                  return DropdownMenuItem<String>(
                    value: province.name,
                    child: Text(province.name),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Pilih Provinsi',
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.location_city),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Select a provinsi';
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(
                height: 12,
              ),
              DropdownButtonFormField<String>(
                value: kabupatenList.isNotEmpty ? kabupatenList[0].name : '',
                onChanged: (String? value) {
                  _kabupaten.text = value!;
                },
                items: kabupatenList.map((Kabupaten kabupaten) {
                  return DropdownMenuItem<String>(
                    value: kabupaten.name,
                    child: Text(kabupaten.name),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Pilih Kabupaten',
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.location_city),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Select a kabupaten';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                autofocus: true,
                controller: _pekerjaan,
                decoration: const InputDecoration(
                    labelText: "pekerjaan", border: OutlineInputBorder()),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "enter some text bro";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                autofocus: true,
                controller: _pendidikan,
                decoration: const InputDecoration(
                    labelText: "Pendidikan", border: OutlineInputBorder()),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "enter some text bro";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 12,
              ),

              // Button
              ElevatedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    //   // Form is valid, perform form submission logic here
                    //   print("Form submitted");
                    await saveToHive();
                    context.go('/detail');
                  }
                },
                child: Text('Submit'),
              ),
              ElevatedButton(
                onPressed: () async {
                  // if (_formkey.currentState!.validate()) {
                  //   // Form is valid, perform form submission logic here
                  //   print("Form submitted");
                  context.go('/detail');
                  // }
                },
                child: Text('detail'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
