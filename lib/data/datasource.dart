import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:form_registrasi_ktp/domain/entities/provinsi.dart';
import 'package:form_registrasi_ktp/domain/entities/kabupaten.dart';

Future<List<Province>> loadProvince() async {
  final provinceLoad = await rootBundle.loadString('/JSON/provinces.json');
  final List<dynamic> provinsi = json.decode(provinceLoad);

  // final List<dynamic> jsonList = json.decode(data);
  return provinsi
      .map((json) => Province(id: json["id"], name: json["name"]))
      .toList();
}

Future<List<Kabupaten>> loadKabupaten(String provinceId) async {
  final kabupatenLoad = await rootBundle.loadString('/JSON/regencies.json');
  final List<dynamic> kabupaten = json.decode(kabupatenLoad);
  return kabupaten
      .where((json) => json['province_id'] == provinceId)
      .map((json) => Kabupaten(
          id: json['id'], name: json['name'], provinceId: json['province_id']))
      .toList();
}
