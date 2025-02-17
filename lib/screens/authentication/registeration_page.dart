import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/authentication/loginScreen.dart';
import 'package:gap/gap.dart';

import '../../utils/text_utils.dart';
import '../../utils/utility.dart';

class RegisterationPage extends StatefulWidget {
  @override
  _RegisterationPageState createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cmfPassword = TextEditingController();

  bool checkBoxValue = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash_background.jpg'),
              fit: BoxFit.fill
          ),
        ),
        alignment: Alignment.center,
        child: Container(
          height: 400,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
            color: Colors.black.withOpacity(0.1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(filter:ImageFilter.blur(sigmaY: 5,sigmaX: 5),
                child:Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const   Spacer(),
                      Center(child: TextUtil(text: "Login",weight: true,size: 30,)),
                      const   Spacer(),
                      TextUtil(text: "Email",),
                      Container(
                        height: 35,
                        decoration:const  BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.white))
                        ),
                        child:TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: email,
                          autofocus: true,
                          decoration:const  InputDecoration(
                            suffixIcon: Icon(Icons.email_sharp,color: Colors.white,),
                            fillColor: Colors.white,
                            border: InputBorder.none,),
                        ),
                      ),
                      const   Spacer(),
                      TextUtil(text: "Password",),
                      Container(
                        height: 35,
                        decoration:const  BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.white))
                        ),
                        child:TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: password,
                          autovalidateMode: AutovalidateMode.onUnfocus,
                          decoration:const  InputDecoration(
                            suffixIcon: Icon(Icons.lock,color: Colors.white,),
                            fillColor: Colors.white,
                            border: InputBorder.none,),
                          obscureText: true,
                          validator: (input) =>
                          input!.isValidPassword()
                              ? null
                              : "Password Sholud Contains 1 Upper Case Letter, 1 Lower Case Letter, 1 Number, 1 Special Character",
                        ),
                      ),
                      const   Spacer(),
                      TextUtil(text: "Confirm Password",),
                      Container(
                        height: 35,
                        decoration:const  BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.white))
                        ),
                        child:TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: cmfPassword,
                          autovalidateMode: AutovalidateMode.onUnfocus,
                          decoration:const  InputDecoration(
                            suffixIcon: Icon(Icons.lock,color: Colors.white,),
                            fillColor: Colors.white,
                            border: InputBorder.none,),
                          obscureText: true,
                          validator: (input) =>
                          input!.isPasswordMatching(password.text)
                              ? null
                              : "Password Not Matching",
                        ),
                      ),
                      const   Spacer(),
                      const   Spacer(),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration:  BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        alignment: Alignment.center,
                        child: TextUtil(text: "Register",color: Colors.black,),
                      ),
                      const   Spacer(),
                      Center(child:
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => LoginScreen()));
                        },
                        child:Text(
                          "Sign In",
                          style: TextStyle(decoration: TextDecoration.underline, color: Colors.deepPurpleAccent,fontSize: 16,fontWeight:FontWeight.bold),
                        )
                      ),
                      ),
                      const   Spacer(),
                    ],
                  ),
                ) ),
          ),
        ),
      ),
    );
  }
}