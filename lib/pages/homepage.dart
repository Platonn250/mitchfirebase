// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mitchfirebase/read/getusenames.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  Future logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // documents from database
  List<String> docIDs = [];

  // getting documents from database
  Future getDocIds() async {
    await FirebaseFirestore.instance
        .collection("users")
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            }));
  }

  // @override
  // void initState() {
  //   getDocIds();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('User Signed in Successfully' + user.email!),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                child: Icon(Icons.logout),
                onTap: logOut,
              ),
            )
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // MaterialButton(
            //   onPressed: logOut,
            //   color: Colors.deepPurple,
            //   child: Text("LogOut"),
            // ),
            Expanded(
                child: FutureBuilder(
                    future: getDocIds(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                          itemCount: docIDs.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: GetUserNames(
                              documentId: docIDs[index],
                            ));
                          });
                    }))
          ],
        ),
      ),
    );
  }
}
