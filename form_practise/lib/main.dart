import 'package:flutter/material.dart';
import 'package:form_practise/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Forms Practise"),
        ),
        body: const FormsData(),
      ),
    );
  }
}

class FormsData extends StatefulWidget {
  const FormsData({super.key});

  @override
  State<FormsData> createState() {
    return _FormsDataState();
  }
}

class _FormsDataState extends State<FormsData> {
  final _formKey = GlobalKey<FormState>();
  var _userName = "";
  var _password = "";
  final _citySelected = "Lahore";
  var cities = [
    "lahore",
    "karachi",
    "multan",
    "fasailabad",
    "peshawar",
    "islamabad",
    "kabirwala"
  ];

  void _loginSuccessfull() {
    print("this is validate function running");
    if (_formKey.currentState!.validate()) {
      print("This is null check operator");
      _formKey.currentState!.save();
      print("this is username $_userName");
      print("this is username $_password");
      print("this is city selected $_citySelected");
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Login(),
      ));
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (value) {
              _userName = value!;
            },
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value.trim().length <= 1 ||
                  value.trim().length > 50) {
                return "Please Enter value between 1 and 50 characters.";
              }
              return null;
            },
            decoration: const InputDecoration(
              label: Text("Username"),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.elliptical(10, 10),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            onSaved: (value) {
              _password = value!;
            },
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value.trim().length < 5 ||
                  value.trim().length > 50) {
                return "passowrd should be between 5 to 50 characters";
              }
              return null;
            },
            obscureText: true,
            decoration: const InputDecoration(
              label: Text("Password"),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.elliptical(10, 10),
                ),
              ),
            ),
          ),
          // DropdownButtonFormField(
          //   value: _citySelected,
          //   items: [
          //     for (final city in cities)
          //       DropdownMenuItem(
          //         child: Text(city),
          //       ),
          //   ],
          //   onChanged: (value) {
          //     setState(() {
          //       _citySelected = value;
          //     });
          //   },
          // ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: _loginSuccessfull,
                child: const Text("Login"),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Sign up"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
