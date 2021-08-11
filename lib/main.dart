import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  _FormValidationState createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Container(
        padding: EdgeInsets.all(16),
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: Text(
                    "Form Validation",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 8, 0, 0),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Email",
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
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black54,
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black54),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: Colors.black54),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: Colors.black54),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 8, 0, 0),
                  width: MediaQuery.of(context).size.width,
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
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.vpn_key_outlined,
                        color: Colors.black54,
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.black54),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: Colors.black54),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: Colors.black54),
                      ),
                    ),
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
