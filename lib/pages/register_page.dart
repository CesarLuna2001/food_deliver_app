import 'package:flutter/material.dart';
import 'package:food_deliver_app/components/my_button.dart';
import 'package:food_deliver_app/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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