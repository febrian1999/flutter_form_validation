import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Form Validation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormValidation(title: 'Flutter Form Validation'),
    );
  }
}

class FormValidation extends StatefulWidget {
  FormValidation({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FormValidationState createState() {
    return _FormValidationState();
  }
}

class _FormValidationState extends State<FormValidation> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerFirstPassword = TextEditingController();
  TextEditingController controllerSecondPassword = TextEditingController();

  password1Validator(password1) {
    if (password1 == null || password1.isEmpty) {
      return 'Paswsword Is Empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.yellow,
              Colors.yellowAccent,
            ],
          ),
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: Text(
                    "Form Validation",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 16, 0, 0),
                  width: double.infinity,
                  child: Text(
                    "Username",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                // Container(
                // child:
                TextFormField(
                  controller: controllerUser,
                  decoration: InputDecoration(
                    hintText: "Username",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 16, 0, 0),
                  width: double.infinity,
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                // Container(
                // child:
                TextFormField(
                  controller: controllerFirstPassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    prefixIcon: Icon(Icons.vpn_key_outlined),
                  ),
                  validator: (password) {
                    password1Validator(password);
                  },
                ),
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 16, 0, 0),
                  width: double.infinity,
                  child: Text(
                    "Retype Password",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                TextFormField(
                  controller: controllerSecondPassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
