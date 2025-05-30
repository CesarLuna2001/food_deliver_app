import 'package:firebase_auth/firebase_auth.dart';

// Clase que contiene los servicios de autenticación con Firebase
class AuthServices {

  // Obtiene una instancia de FirebaseAuth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Método para obtener el usuario actualmente autenticado (si hay uno)
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // Método para iniciar sesión con correo electrónico y contraseña
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      // Intenta iniciar sesión con los datos proporcionados
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );

      // Retorna las credenciales del usuario autenticado
      return userCredential;

    // Captura cualquier error que ocurra durante el inicio de sesión
    } on FirebaseAuthException catch (e) {
      // Lanza una excepción con el código del error
      throw Exception(e.code);
    }
  }

  // Método para registrar un nuevo usuario con correo electrónico y contraseña
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      // Intenta crear un nuevo usuario con los datos proporcionados
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

      // Retorna las credenciales del usuario registrado
      return userCredential;

    // Captura cualquier error que ocurra durante el registro
    } on FirebaseAuthException catch (e) {
      // Lanza una excepción con el código del error
      throw Exception(e.code);
    }
  }  

  // Método para cerrar sesión
  Future<void> signOut() async {
    // Cierra la sesión del usuario actual
    return await _firebaseAuth.signOut();
  }

}
