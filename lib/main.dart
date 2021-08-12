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
                  padding: EdgeInsets.fromLTRB(24, 16, 0, 16),
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
                  validator: (password1) {
                    password1Validator(password1);
                  },
                ),
                // ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
