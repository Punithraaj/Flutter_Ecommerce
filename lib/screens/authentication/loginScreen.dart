import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/authentication/registeration_page.dart';
import 'package:flutter_ecommerce/utils/utility.dart';
import '../../utils/text_utils.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
                          autovalidateMode: AutovalidateMode.onUnfocus,
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
                      const Spacer(),
                      Row(
                        children: [
                          Checkbox(
                            side: BorderSide(
                              color: Colors.white,
                              width: 1.5,
                            ),
                            activeColor: Colors.green,
                            value: checkBoxValue,
                            checkColor: Colors.white,
                            onChanged: (bool? value) {
                              setState(() {
                                checkBoxValue = value!;
                              });
                            },
                          ),
                          const  SizedBox(width: 10,),
                          Expanded(child: TextUtil(text: "Remember Me , FORGET PASSWORD",size: 12,weight: true,))
                        ],
                      ),
                      const   Spacer(),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration:  BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        alignment: Alignment.center,
                        child: TextUtil(text: "Log In",color: Colors.black,),
                      ),
                      const   Spacer(),
                      Center(child:
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => RegisterationPage()));
                        },
                        child:Text(
                          "Don't have a account REGISTER",
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