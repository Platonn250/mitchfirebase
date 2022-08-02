// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, prefer_const_constructors

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
            return Text('${data['first name']}' +
                ' ' +
                "${data['last name']}" +
                ', ' +
                '${data['age']}' +
                " Years Old");
          }
          return Text('Loading');
        });
  }
}
