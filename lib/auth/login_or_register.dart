import 'package:flutter/material.dart';
import 'package:food_deliver/pages/client/login_page.dart';
import 'package:food_deliver/pages/client/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  //initially, show login page
  bool showLoginPage = true;

  //toggle between login and register page
  void togglePage(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLoginPage ? LoginPage(onTap: togglePage,) 
    : RegisterPage(onTap: togglePage);
  }
}