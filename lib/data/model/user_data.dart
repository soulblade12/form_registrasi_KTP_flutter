import 'package:hive/hive.dart';

part 'user_data.g.dart';

@HiveType(typeId: 0)
class UserData extends HiveObject {
  @HiveField(0)
  String nama;

  @HiveField(1)
  String dob;

  @HiveField(2)
  String provinsi;

  @HiveField(3)
  String kabupaten;

  @HiveField(4)
  String pekerjaan;

  @HiveField(5)
  String pendidikan;

  UserData({
    required this.nama,
    required this.dob,
    required this.provinsi,
    required this.kabupaten,
    required this.pekerjaan,
    required this.pendidikan,
  });
}
