import 'dart:convert';

// List<Province> ProvinceFromJson(String str) =>
//     List<Province>.from(json.decode(str).map((x) => Province.fromJson(x)));

// String ProvinceToJson(List<Province> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Province {
  String id;
  String name;
  // String altName;
  // double latitude;
  // double longitude;

  Province({
    required this.id,
    required this.name,
  });
}
