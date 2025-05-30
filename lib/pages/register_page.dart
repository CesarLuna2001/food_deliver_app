import 'package:flutter/material.dart';
import 'package:food_deliver_app/components/my_button.dart';
import 'package:food_deliver_app/components/my_textfield.dart';
import 'package:food_deliver_app/services/auth/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap; // Callback para cambiar a la página de login
  
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controladores para capturar texto de los campos de email y contraseñas
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Método para registrar usuario
  void register() async {
    // Obtener instancia del servicio de autenticación
    final _authService = AuthServices();

    // Verificar que las contraseñas coincidan antes de crear el usuario
    if(passwordController.text == confirmPasswordController.text) {
      try {
        // Intentar crear usuario con email y contraseña
        await _authService.signUpWithEmailPassword(
          emailController.text, 
          passwordController.text
        );
      }
      catch (e) {
        // Mostrar diálogo si ocurre un error en la creación
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          )
        );
      }
    }
    else {
      // Si las contraseñas no coinciden, mostrar mensaje de error
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
      // Fondo según tema
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // Icono o logo en la parte superior
          Icon(
            Icons.lock_open, 
            size: 100, 
            color: Theme.of(context).colorScheme.inversePrimary,
          ),

          const SizedBox(height: 25),

          // Mensaje introductorio
          Text(
            "Let's Create an account for you", 
            style: TextStyle(
              fontSize: 16, 
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          const SizedBox(height: 25),

          // Campo para ingresar email
          MyTextField(
            controller: emailController, 
            hintText: "Email", 
            obscureText: false,
          ),

          const SizedBox(height: 10),

          // Campo para ingresar contraseña
          MyTextField(
            controller: passwordController, 
            hintText: "Password", 
            obscureText: true,
          ),

          const SizedBox(height: 10),

          // Campo para confirmar contraseña
          MyTextField(
            controller: confirmPasswordController, 
            hintText: "Confirm Password", 
            obscureText: true,
          ),

          const SizedBox(height: 10),

          // Botón para registrarse, que llama al método register
          MyButton(
            text: "Sign Up", 
            onTap: () { 
              register();
            },
          ),

          const SizedBox(height: 25),

          // Texto y enlace para cambiar a página de login
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
                onTap: widget.onTap, // Cambia a login al tocar
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
