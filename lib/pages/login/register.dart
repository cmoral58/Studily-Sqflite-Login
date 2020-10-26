import 'package:flutter/material.dart';

import '../../data/database-helper.dart';
import '../../models/user.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _name, _username, _password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _ctx = context;
    var loginBtn = new RaisedButton(
      onPressed: _submit,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: new Text(
        "Sign Up",
        style: TextStyle(color: Colors.white),
      ),
      color: Color(0xff6159E6),
    );
    var registerBtn = new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Already have an account? ",
          style: TextStyle(
            color: Color(0xff6159E6),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
          child: new Text(
            "Sign In",
            style: TextStyle(
                color: Color(0xff6159E6), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new SizedBox(
          height: size.height * 0.09,
        ),
        new Text(
          "Register",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontSize: 26),
        ),
        new Image.asset(
          "assets/RegisterScreenImages/undraw_Access_account_re_8spm(1).png",
          width: size.width * 0.9,
        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.symmetric(vertical: 5),
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
                  onSaved: (val) => _name = val,
                  decoration: new InputDecoration(
                    icon: Icon(
                      Icons.person_add_alt_1_outlined,
                      color: Color(0xff6159E6),
                    ),
                    hintText: "Enter First Name",
                    border: InputBorder.none,
                  ),
                ),
              ),
              new Container(
                margin: EdgeInsets.symmetric(vertical: 5),
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
                  onSaved: (val) => _username = val,
                  decoration: new InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Color(0xff6159E6),
                      ),
                      hintText: "Enter Email",
                      border: InputBorder.none),
                ),
              ),
              new Container(
                margin: EdgeInsets.symmetric(vertical: 5),
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
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
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
      resizeToAvoidBottomPadding: false,
      key: scaffoldKey,
      body: new SingleChildScrollView(
        child: new Center(
          child: loginForm,
        ),
      ),
    );
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        var user =
            new User(_name.trim(), _username.trim(), _password.trim(), null);
        var db = new DatabaseHelper();
        db.saveUser(user);
        _isLoading = false;
        Navigator.of(context).pushNamed("/login");
      });
    }
  }
}
