import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_deliver/components/my_button.dart';
import 'package:food_deliver/components/my_textfield.dart';
import 'package:food_deliver/pages/Deliver/deliver_home_page.dart';
import 'package:lottie/lottie.dart';

class DeliverLoginPage extends StatefulWidget {
  final void Function()? onTap;

  const DeliverLoginPage({super.key, required this.onTap});

  @override
  State<DeliverLoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<DeliverLoginPage> {

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final nameFocus = FocusNode();
  final passWordFocus = FocusNode();
  final focussubmission = FocusNode();
  final formkey = GlobalKey<FormState>();

  void submission(){
    if(focussubmission.hasFocus){
      if(formkey.currentState!.validate()){
        focussubmission.unfocus();
        (){};
      }
    }
  }

    @override
  void initState() {
    super.initState();
    // Écouter les changements de focussubmission
    focussubmission.addListener(submission);
  }

  //login method
  void login(){
    //authentification

    //home page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> const DeliverHomePage(),)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title:Row(
          children: [
            Spacer(),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.user),
              color: Theme.of(context).colorScheme.inversePrimary,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 5,)
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Lottie.asset(
            'assets/deliver_log_reg.json',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 25),

          //app slogan
          Text(
            "Food Delivery App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          const SizedBox(height: 25),
          
          //emailtextfield
          MyTextfield(
            hintText: "Email", 
            obscureText: false, 
            controller: emailController,
            focusNode: emailFocus,
            focusnext: nameFocus,
            ),
          SizedBox(height: 10,),

          //Name of fastfood
          MyTextfield(
            hintText: "Enter the name of your restaurant", 
            obscureText: false, 
            controller: nameController,
            focusNode: nameFocus,
            focusnext: passWordFocus,
          ),
          SizedBox(height: 10,),

          //password textfield
          MyTextfield(
            hintText: "Password", 
            obscureText: true, 
            controller: passwordController,
            focusNode: passWordFocus,
            ),
          SizedBox(height: 10,),

          //sign in button
          MyButton(
            onTap: login,
            text: "Log in",
            color: Colors.greenAccent,
            ),
          SizedBox(height: 20,),

          //register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(width: 5,),
              GestureDetector(
                onTap: widget.onTap,
                child: Text("Register now",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}