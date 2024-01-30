import 'package:flutter/material.dart';
import 'package:form_registrasi_ktp/data/model/user_data.dart';
import 'package:form_registrasi_ktp/presentation/widget/card_user.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final UserData userData = ModalRoute.of(context)!.settings.arguments as UserData;

    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/form');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: Hive.openBox<UserData>('userDataBox'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final userBox = Hive.box<UserData>('userDataBox');
              return ListView.builder(
                itemCount: userBox.length,
                itemBuilder: (context, index) {
                  UserData userData = userBox.getAt(index)!;
                  return CardUser(
                    userData: userData,
                  );
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
