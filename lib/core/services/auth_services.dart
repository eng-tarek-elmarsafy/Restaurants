import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthServices {
  Future<User> signUpWithEmail(
    String email,
    String password,
    String numberPhone,
    String userName,
  );
  Future<User> signInWithEmail(String email, String password);

  Future<void> forgotPassword(String email);
}
