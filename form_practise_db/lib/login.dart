import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_practise_db/signup.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _loginCheck() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final url = Uri.https(
        "signupform-3ee43-default-rtdb.firebaseio.com",
        "user-data.json",
      );
      try {
        final response = await http.get(url);
        print("this is status code ${response.statusCode}");
        if (response.statusCode >= 400) {
          const snackBar = SnackBar(
            content: Text("Failed to check. Please try again later"),
            duration: Duration(
              seconds: 3,
            ),
            backgroundColor: Colors.red,
          );
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        }
        if (response.statusCode < 300) {
          final Map<String, dynamic> userTable = json.decode(response.body);
          print(userTable);
          print("these are values : ${userTable.values}");
          // final value = userTable.entries;
          // print(value.first.value.);

          // if () {
          //   print("yes the user exit mazay kr bhai");
          // }
        }
      } catch (error) {
        print(
          "Some error occured please try again later",
        );
        print("this is status code $error");
      }
      print("this is username : ${_username.text}");
      print("this is password : ${_password.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 80),
              const Text(
                "Login",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      value.trim().length > 60) {
                    return "Invalid Email address";
                  }
                  return null;
                },
                controller: _username,
                decoration: const InputDecoration(
                  label: Text("Email"),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      value.trim().length > 50) {
                    return "Invalid Password Length";
                  }
                  return null;
                },
                controller: _password,
                decoration: const InputDecoration(
                  label: Text("Password"),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    // backgroundColor: Colors.green,
                  ),
                  onPressed: _loginCheck,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("create account"),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      ));
                    },
                    child: const Text(
                      "?SignUp",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
