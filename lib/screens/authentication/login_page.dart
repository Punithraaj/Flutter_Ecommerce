import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/authentication/registeration_page.dart';
import 'package:gap/gap.dart';

import '../../utility.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email =
      TextEditingController(text: 'example@email.com');

  TextEditingController password = TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    Widget welcomeBack = Text(
      'Welcome Back,',
      style: TextStyle(
          color: Colors.white,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );

    Widget subTitle = Padding(
        padding: const EdgeInsets.only(right: 56.0),
        child: Text(
          'Login to your account using\nMobile number',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ));

    Widget loginButton = Positioned(
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => Scaffold()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 30,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(236, 60, 3, 1),
                    Color.fromRGBO(234, 60, 3, 1),
                    Color.fromRGBO(216, 78, 16, 1),
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(9.0)),
          child: Center(
              child: Text("Log In",
                  style: const TextStyle(
                      color: Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
        ),
      ),
    );

    Widget registerButton = Positioned(
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => RegisterationPage()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 30,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(236, 60, 3, 1),
                    Color.fromRGBO(234, 60, 3, 1),
                    Color.fromRGBO(216, 78, 16, 1),
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(9.0)),
          child: Center(
              child: Text("Sign Up",
                  style: TextStyle(
                      color: Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
        ),
      ),
    );

    Widget loginForm = Container(
      height: 350,
      padding: const EdgeInsets.only(left: 4, right: 32.0, top: 32.0, bottom: 32.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: email,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                      signed: true,
                    ),
                    controller: password,
                    style: TextStyle(fontSize: 16.0),
                    autovalidateMode: AutovalidateMode.always,
                    validator: (input) => input!. isValidPassword() ? null : "Password Sholud Contains 1 Upper Case Letter, 1 Lower Case Letter, 1 Number, 1 Special Character",
                  ),
                ),
              ],
            ),
          ),
          Gap(8),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                loginButton,
                registerButton
              ],
            )

        ],
      ),
    );

    Widget forgotPassword = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Forgot your password? ',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Color.fromRGBO(255, 255, 255, 0.5),
              fontSize: 14.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Reset password',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(

      body: Stack(
        children: <Widget>[

          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('splash_background.jpg'),
                  fit: BoxFit.cover)
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: transparentYellow,

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(flex: 3),
                welcomeBack,
                Spacer(),
                subTitle,
                Spacer(flex: 2),
                loginForm,
                Spacer(flex: 2),
                forgotPassword
              ],
            ),
          )
        ],
      ),
    );
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    return RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(this);
  }
}