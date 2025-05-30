import 'package:flutter/material.dart';
import 'package:food_deliver_app/components/my_button.dart';
import 'package:food_deliver_app/components/my_textfield.dart';
import 'package:food_deliver_app/services/auth/auth_services.dart';

class LoginPage extends StatefulWidget {
  // Callback que se ejecuta cuando el usuario toca "Register now"
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controladores para obtener texto de los campos Email y Password
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Método para iniciar sesión
  void login() async {
    // Instancia del servicio de autenticación
    final _authService = AuthServices();

    try {
      // Intenta iniciar sesión con email y contraseña
      await _authService.signInWithEmailPassword(
        emailController.text, 
        passwordController.text
      );
    }
    catch (e) {
      // En caso de error, muestra un diálogo con el mensaje
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        )
      );
    }
  }

  // Método para cuando el usuario olvida su contraseña
  void forgotPw() {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("User tapped forgot password"),
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo de la página con color del tema
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // Icono del logo
          Icon(
            Icons.lock_open, 
            size: 100, 
            color: Theme.of(context).colorScheme.inversePrimary,
          ),

          const SizedBox(height: 25),

          // Texto descriptivo o nombre de la app
          Text(
            "Food Delivery App", 
            style: TextStyle(
              fontSize: 16, 
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          const SizedBox(height: 25),

          // Campo para ingresar Email
          MyTextField(
            controller: emailController, 
            hintText: "Email", 
            obscureText: false,
          ),

          const SizedBox(height: 10),

          // Campo para ingresar Password (oculto)
          MyTextField(
            controller: passwordController, 
            hintText: "Password", 
            obscureText: true,
          ),

          const SizedBox(height: 10),

          // Botón para iniciar sesión, ejecuta la función login()
          MyButton(
            text: "Sign In", 
            onTap: login
          ),

          const SizedBox(height: 25),

          // Texto para invitar a registrarse si no es miembro
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
              // Texto "Register now" que se puede tocar para ejecutar el callback onTap
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
