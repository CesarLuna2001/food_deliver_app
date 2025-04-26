import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver_app/firebase_options.dart';
import 'package:food_deliver_app/models/restaurant.dart';
import 'package:food_deliver_app/pages/home_page.dart';
import 'package:food_deliver_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); 

  runApp(
    MultiProvider(
      providers: [
     //theme
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
     //restaurant
      ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(), 
      theme: Provider.of<ThemeProvider>(context).themeData, // Use the theme from ThemeProvider
    );   
  }
}
