import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thousand/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileName extends StatefulWidget {
  @override
  _ProfileNameState createState() => _ProfileNameState();
}

class _ProfileNameState extends State<ProfileName> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final useruid = user.uid;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: Text(
          'Change Name',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              DocumentReference user =
                  FirebaseFirestore.instance.collection('user').doc(useruid);
              user.update({
                'name': _controller.text,
              }).then((value) {});

              Navigator.pop(context);
            },
            icon: Icon(
              FontAwesomeIcons.check,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                style: TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  // helperText: 'Keep it short and precise',
                  helperStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                maxLines: 1,
                maxLength: 40,
                controller: _controller,
                // validator: (value) => value.isEmpty
                //     ? 'Please fill this field'
                //     : null,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
