import 'package:escritorio_jm/components/my_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AutenticacaoServico {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuario({
    required String senha, required String email
  }) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: senha);

      await user.user!.updateDisplayName(email);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return e.toString();
      }
      return "Erro desconhecido";
    }
  }

  Future<String?> logarUsuario(
      {required String email, required String senha}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future <void> deslogar() async{
    return _firebaseAuth.signOut();
  }
}