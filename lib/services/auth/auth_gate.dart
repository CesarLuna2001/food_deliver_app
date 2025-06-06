import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver_app/pages/home_page.dart';
import 'package:food_deliver_app/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot) {
          //user is logged in
          if(snapshot.hasData) {
            return const HomePage(); // Replace with your home page widget
          }

          //user is not logged in
          return const LoginOrRegister(); // Replace with your login or register widget
        }
      )
    );
  }
}