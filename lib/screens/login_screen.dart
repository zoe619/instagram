import 'package:flutter/material.dart';
import 'package:instagram/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget{

  static final String id = "login_screen";
  _LoginScreenState createState()=> _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{

//  allow us to set up validation for the form
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  _submit()
  {
      if(_formKey.currentState.validate())
      {
        _formKey.currentState.save();
        print(_email + " " + _password);
      }
//      login user with firebase
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('clustar', style: TextStyle(
              fontFamily: 'Billabong',
              fontSize: 50.0
            ),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (input)=>!input.contains('@') ? 'please enter a valid email' : null,
                      onSaved: (input)=> _email = input,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (input)=> input.length < 6 ? 'password length must be atleast 6 characters' : null,
                      onSaved: (input)=> _password = input,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: 250,
                    child: FlatButton(
                      onPressed: _submit,
                      color: Colors.blue,
                      padding: EdgeInsets.all(10.0),
                      child: Text('Login', style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: 250,
                    child: FlatButton(
                      onPressed: ()=> Navigator.pushNamed(context, SignupScreen.id),
                      color: Colors.redAccent,
                      padding: EdgeInsets.all(10.0),
                      child: Text('Go To Signup', style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}