import 'package:flutter/material.dart';
import 'package:food_deliver/components/my_button.dart';
import 'package:food_deliver/components/my_textfield.dart';
import 'package:food_deliver/pages/home_page.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {

  final void Function ()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassWordController = TextEditingController();
  final emailFocus = FocusNode();
  final passWordFocus = FocusNode();
  final confirmPassWordFocus = FocusNode();
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

  //signup method
  void signup(){
    //authentification

    //home page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> const HomePage(),)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Lottie.asset(
            'assets/log_reg.json',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 25),

          //app slogan
          Text(
            "Create a new account",
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
            focusnext: passWordFocus,
            ),
          SizedBox(height: 10,),

          //password textfield
          MyTextfield(
            hintText: "Password", 
            obscureText: true, 
            controller: passwordController,
            focusNode: passWordFocus,
            focusnext: confirmPassWordFocus,
            ),
          SizedBox(height: 10,),

          //confirm password textfield
          MyTextfield(
            hintText: "Confirm the password", 
            obscureText: true, 
            controller: confirmPassWordController,
            focusNode: confirmPassWordFocus,),
          SizedBox(height: 10,),

          //sign up button
          MyButton(
            onTap: signup,
            text: "Sign up",
            ),
          SizedBox(height: 20,),

          //Log in
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have a account?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(width: 5,),
              GestureDetector(
                onTap: widget.onTap,
                child: Text("Log in",
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