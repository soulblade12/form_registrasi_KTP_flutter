// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';

class Kabupaten {
  String id;
  String provinceId;
  String name;

  Kabupaten({
    required this.id,
    required this.provinceId,
    required this.name,
  });

  // factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
  //       id: json["id"],
  //       provinceId: json["province_id"],
  //       name: json["name"],
  //       altName: json["alt_name"],
  //       latitude: json["latitude"]?.toDouble(),
  //       longitude: json["longitude"]?.toDouble(),
  //     );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "province_id": provinceId,
  //       "name": name,
  //       "alt_name": altName,
  //       "latitude": latitude,
  //       "longitude": longitude,
  //     };
}
