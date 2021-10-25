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

  submitOnPressed() {
    if (_formKey.currentState!.validate()) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Processing Data')),
      // );
    }
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
          child: SingleChildScrollView(
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
                  Container(
                    height: 64,
                    child: TextFormField(
                      controller: controllerUser,
                      decoration: InputDecoration(
                        hintText: "Username",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                      ),
                      validator: (username) {
                        if (username == null || username.isEmpty) {
                          return 'Username is empty';
                        }
                        return null;
                      },
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
                  Container(
                    height: 64,
                    child: TextFormField(
                      controller: controllerFirstPassword,
                      decoration: InputDecoration(
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key_outlined,
                          color: Colors.black,
                        ),
                      ),
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Password is empty';
                        }
                        return null;
                      },
                    ),
                  ),
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
                  Container(
                    height: 64,
                    child: TextFormField(
                      controller: controllerSecondPassword,
                      decoration: InputDecoration(
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                      ),
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return "Password is empty";
                        } else if (password != controllerFirstPassword.text) {
                          return "Password didn't match";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 32, 0, 8),
                    child: ElevatedButton(
                      onPressed: () {
                        submitOnPressed();
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black87,
                        minimumSize: Size.fromHeight(48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
