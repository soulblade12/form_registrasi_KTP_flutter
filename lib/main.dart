import 'package:flutter/material.dart';
import 'package:form_registrasi_ktp/presentation/form.dart';
import 'package:form_registrasi_ktp/presentation/form_detail.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:form_registrasi_ktp/data/model/user_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserDataAdapter());
  // await Hive.openBox('usersdata');
  runApp(const MyApp());
}

final _router = GoRouter(initialLocation: '/form', routes: [
  GoRoute(
    name: 'form',
    path: '/form',
    builder: (context, state) => MyForm(),
  ),
  GoRoute(
    name: 'detail',
    path: '/detail',
    builder: (context, state) => SecondPage(),
  ),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: MyForm(),
      routerConfig: _router,
    );
  }
}
