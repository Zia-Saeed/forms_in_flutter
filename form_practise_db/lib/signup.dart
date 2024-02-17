import 'package:flutter/material.dart';
import 'package:form_practise_db/home.dart';
import 'package:form_practise_db/login.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;

  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _address = TextEditingController();

  void _signUpSuccessfull() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final url = Uri.https(
        "signupform-3ee43-default-rtdb.firebaseio.com",
        "user-data.json",
      );
      try {
        final response = await http.post(
          url,
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({
            "username": _emailAddress.text,
            "password": _password.text,
            "address": _address.text
          }),
        );
        if (response.statusCode < 300 && context.mounted) {
          _isLoading = false;
          _formKey.currentState!.reset();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Home(),
          ));
        }
      } catch (error) {
        // print("this is error $error");
        const snackBar = SnackBar(
          content: Text(
            "Unable to create account due to some reason try again later",
          ),
          duration: Duration(seconds: 2),
        );

        if (!context.mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      // print(_emailAddress.text);
      // print(_password.text);
      // print(_address.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Create Account",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "SignUp",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _emailAddress,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length > 50 ||
                            value.trim().length < 12) {
                          return "Invalid Email Please Input valid Email";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: const Text("Email"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _password,
                      validator: (value) {
                        if (value == null ||
                            value.trim().length < 6 ||
                            value.isEmpty) {
                          return "Password length should be greater than 6";
                        }
                        return null;
                      },
                      obscureText: true,
                      // keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text("Password"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _address,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length > 50 ||
                            value.trim().length < 5) {
                          return "Masti nhi sahi address dal";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        label: Text("Address"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          // backgroundColor: Colors.green,
                        ),
                        onPressed: _signUpSuccessfull,
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have a account "),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ));
                          },
                          child: const Text(
                            "?Login",
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
          ],
        ),
      ),
    );
  }
}
