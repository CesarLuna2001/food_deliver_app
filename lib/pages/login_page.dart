import 'package:flutter/material.dart';
import 'package:food_deliver_app/components/my_button.dart';
import 'package:food_deliver_app/components/my_textfield.dart';
import 'package:food_deliver_app/services/auth/auth_services.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;


  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //login method
  void login() async {
    //get instance of auth service
    final _authService = AuthServices();

    //try to sign in 
    try {
      await _authService.signInWithEmailPassword(
        emailController.text, 
        passwordController.text
      );
    }

    //display any errors
    catch (e) {
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        )
      );
    }
  }

  void forgotPw() {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Usser tapped forgot password"),
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //Logo
          Icon(
            Icons.lock_open, 
            size: 100, 
            color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

          //Message
          Text(
            "Food Delivery App", 
            style: TextStyle(
              fontSize: 16, 
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          const SizedBox(height: 25),

          //Email TextField
          MyTextField(
            controller: emailController, 
            hintText: "Email", 
            obscureText: false,
          ),

          const SizedBox(height: 10),

          //Password TextField
          MyTextField(
            controller: passwordController, 
            hintText: "Password", 
            obscureText: true,
          ),

          const SizedBox(height: 10),

          //Sign In Button
          MyButton(
            text: "Sign In", 
            onTap: login
          ),

          const SizedBox(height: 25),

          //not member? register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not a member?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Register now",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}