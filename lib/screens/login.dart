import 'package:flutter/material.dart';
import 'package:sandbox/screens/home.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _password;
  bool _isInvalidPassword = false;
  bool _autoValidate = false;

  TextStyle textStyle =
      TextStyle(fontFamily: 'Montserrat', fontSize: 16.0, color: Colors.black);

  Widget emailField() {
    return new Material(
        borderRadius: BorderRadius.circular(10.0),
        child: TextFormField(
          validator: (String arg) {
            if (!EmailValidator.validate(arg))
              return 'Email inválido';
            else
              return null;
          },
          obscureText: false,
          style: textStyle,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
        ));
  }

  Widget passwordField() {
    return new Material(
      borderRadius: BorderRadius.circular(10.0),
      child: TextField(
        obscureText: true,
        onChanged: (String args) {
          _password = args;
        },
        style: textStyle,
        decoration: InputDecoration(
            errorText: (_isInvalidPassword ? "Senha inválida" : null),
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.white, width: 2.0)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }

  Widget loginButton() {
    return new Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Color(0xff6600ff),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => login(),
        child: Text("Login",
            textAlign: TextAlign.center,
            style: textStyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
    );
  }

  Widget formUI() {
    return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              color: Colors.black54,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 70.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Movie Time',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 70,
                        ),
                      ),
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
                      emailField(),
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
                      passwordField(),
                      SizedBox(height: 10.0),
                      loginButton()
                    ],
                  )))
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/wallpaper.jpeg'), fit: BoxFit.cover),
        ),
        child:
            Form(key: _formKey, autovalidate: _autoValidate, child: formUI()),
      ),
    );
  }

  void login() {
    setState(
        () => _isInvalidPassword = (_password == null || _password.isEmpty));

    if (_formKey.currentState.validate() && !_isInvalidPassword) {
      _formKey.currentState.save();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
