import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {

  //get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  //sign in
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );

      return userCredential;

    }

    //Catch any errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign up
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

      return userCredential;

    }

    //Catch any errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }  

  //signt out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

}