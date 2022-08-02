import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserNames extends StatelessWidget {
  const GetUserNames({Key? key, required this.documentId}) : super(key: key);

  final String documentId;

  @override
  Widget build(BuildContext context) {
    // get collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('last name: ${data['age']}');
          }
          return Text('Loading');
        });
  }
}
