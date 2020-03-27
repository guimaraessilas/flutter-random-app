import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login UI',
      home: LoginScreen(title: 'Flutter Login'),
    );
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  TextStyle textStyle =
      TextStyle(fontFamily: 'Montserrat', fontSize: 16.0, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    final emailField = Material(
        borderRadius: BorderRadius.circular(10.0),
        child: TextFormField(
          obscureText: false,
          style: textStyle,
          decoration: InputDecoration(
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
        ));

    final passwordField = Material(
      borderRadius: BorderRadius.circular(10.0),
      child: TextField(
        obscureText: true,
        style: textStyle,
        decoration: InputDecoration(
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.white, width: 2.0)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Login",
            textAlign: TextAlign.center,
            style: textStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final form =
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(
        'LOGIN',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 70,
        ),
      ),
      Container(
          color: Colors.black45,
          child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 70.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  emailField,
                  SizedBox(height: 5.0),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password:',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  passwordField,
                  SizedBox(height: 10.0),
                  loginButton
                ],
              )))
    ]);

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/wallpaper.jpeg'), fit: BoxFit.cover),
          ),
          child: form),
    );
  }
}
