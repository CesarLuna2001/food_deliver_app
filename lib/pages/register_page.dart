import 'package:flutter/material.dart';
import 'package:food_deliver_app/components/my_button.dart';
import 'package:food_deliver_app/components/my_textfield.dart';
import 'package:food_deliver_app/services/auth/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //register method
  void register() async {
    //get auth service
    final _authService = AuthServices();

    //check if passwords match -> create user
    if(passwordController.text == confirmPasswordController.text) {
      //Try creating user
      try {
        await _authService.signUpWithEmailPassword(
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

    //if passwword don't match -> show error 
    else {
      showDialog(
          context: context, 
          builder: (context) => const AlertDialog(
            title: Text("Passwords do not match"),
          )
        );
    }
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
            "Let's Create an account for you", 
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

          //Confirm Password TextField
          MyTextField(
            controller: confirmPasswordController, 
            hintText: "Confirm Password", 
            obscureText: true,
          ),

          const SizedBox(height: 10),

          //Sign Up Button
          MyButton(
            text: "Sign Up", 
            onTap: () {}
          ),

          const SizedBox(height: 25),

          //Already have an account? Sign in now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Login now",
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