import 'package:flutter/material.dart';
import 'package:message/components/FABcustom.dart';
import 'package:message/components/Textfieldcustom.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: Center(child: Text('Messenger App')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 200,
            ),
            TextfieldCustom(
                textEditingController: email,
                hintText: "Email",
                obscureText: false),
            SizedBox(
              height: 15,
            ),
            TextfieldCustom(
                textEditingController: pass,
                hintText: "Password",
                obscureText: true),
            SizedBox(
              height: 15,
            ),
            FABcustom(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/Loggedin',
                  );
                },
                text: "Sign In"),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Not a user?"),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/Signup',
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )),
              ],
            )
          ],
        )),
      ),
    );
  }
}
