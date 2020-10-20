import 'package:flutter/material.dart';

import '../../data/database-helper.dart';
import 'package:Studily/pages/login/login_presenter.dart';
import '../../models/user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _email, _password;

  LoginPagePresenter _presenter;

  _LoginPageState() {
    _presenter = new LoginPagePresenter(this);
  }

  void _register() {
    Navigator.of(context).pushNamed("/register");
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_email, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _ctx = context;
    var loginBtn = new RaisedButton(
      onPressed: _submit,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: new Text(
        "Sign In",
        style: TextStyle(color: Colors.white),
      ),
      color: Color(0xff6159E6),
    );
    // var registerBtn = new RaisedButton(
    //   onPressed: _register,
    //   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
    //   child: new Text(
    //     "Don't have an account? Sign Up",
    //     style: TextStyle(color: Colors.white),
    //   ),
    //   color: Color(0xff6159E6),
    // );
    var registerBtn = new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Don't have an account? ",
          style: TextStyle(
            color: Color(0xff6159E6),
          ),
        ),
        GestureDetector(
          onTap: _register,
          child: new Text(
            "Sign Up",
            style: TextStyle(
                color: Color(0xff6159E6), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
    var loginForm = new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // new Positioned(
        //   top: 0,
        //   left: 0,
        //   child: Image.asset(
        //     'assets/LoginScreenImages/TopLeftBubble.png',
        //     width: size.width * 1.2,
        //   ),
        // ),
        new SizedBox(
          height: size.height * 0.1,
        ),
        new Text(
          "Login",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontSize: 26),
        ),
        new Image.asset(
          'assets/LoginScreenImages/undraw_unlock_24mb.png',
          width: size.width * 2,
        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Color(0xff6159E6),
                  ),
                ),
                child: new TextFormField(
                  onSaved: (val) => _email = val,
                  decoration: new InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Color(0xff6159E6),
                      ),
                      hintText: "Enter Email",
                      // labelText: "Email",
                      border: InputBorder.none),
                ),
              ),
              new Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Color(0xff6159E6),
                  ),
                ),
                child: new TextFormField(
                  obscureText: true,
                  onSaved: (val) => _password = val,
                  decoration: new InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Color(0xff6159E6),
                      ),
                      hintText: "Enter Password",
                      // labelText: "Password",
                      border: InputBorder.none),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        new Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: size.width * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: loginBtn,
          ),
        ),
        new Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: size.width * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: registerBtn,
          ),
        ),
      ],
    );

    return new Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: new SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            loginForm,
          ],
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    // ignore: todo
    // TODO: implement onLoginError
    _showSnackBar("Login not successful");
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    // ignore: todo
    // TODO: implement onLoginSuccess
    if (user.username == "") {
      _showSnackBar("Login not successful");
    } else {
      _showSnackBar(user.toString());
    }
    setState(() {
      _isLoading = false;
    });
    if (user.flaglogged == "logged") {
      print("Logged");
      Navigator.of(context).pushNamed("/home");
    } else {
      print("Not Logged");
    }
  }
}
