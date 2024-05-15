import 'package:flutter/material.dart';
import 'package:message/components/Textfieldcustom.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController username = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: Center(child: Text("Sign Up")),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      surfaceTintColor: Colors.black,
                      title: Text('Log Out'),
                      content: Text('Are you sure you want to log out?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Sign Out',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.red,
                              )),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pop(context); // Close the dialog
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              )),
          Container(
            width: MediaQuery.of(context).size.width / 60,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: TextfieldCustom(
                    textEditingController: username,
                    hintText: "Enter Username",
                    obscureText: false))
          ],
        ),
      ),
    );
  }
}
