import 'package:flutter/material.dart';
import 'package:form_registrasi_ktp/data/model/user_data.dart';
import 'package:go_router/go_router.dart';

class CardUser extends StatelessWidget {
  final UserData userData;

  const CardUser({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // Replace 'data' with the actual user data text
                "${userData.nama}",
                style: TextStyle(fontSize: 50.0),
              ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Navigate to the form page with user data for editing
                        // context.go('/form');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Implement delete functionality
                        // For example, show a confirmation dialog and delete if confirmed
                        showDeleteConfirmationDialog(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete User Data'),
          content: Text('Are you sure you want to delete this user data?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Implement delete logic here
                // Navigator.pop(context); // Optional: Pop the dialog
                Navigator.pop(context, true); // Return a value if needed
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
