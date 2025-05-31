import 'package:flutter/material.dart';
import 'package:food_deliver/pages/Deliver/deliver_login_page.dart';
import 'package:food_deliver/pages/Deliver/deliver_register_page.dart';


class DeliverLoginOrRegister extends StatefulWidget {
  const DeliverLoginOrRegister({super.key});

  @override
  State<DeliverLoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<DeliverLoginOrRegister> {

  //initially, show login page
  bool showDeliverLoginPage = true;

  //toggle between login and register page
  void togglePage(){
    setState(() {
      showDeliverLoginPage = !showDeliverLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showDeliverLoginPage ? DeliverLoginPage(onTap: togglePage,) 
    : DeliverRegisterPage(onTap: togglePage);
  }
}