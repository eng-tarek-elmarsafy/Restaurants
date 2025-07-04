import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthEmailServices {
  Future<AuthResponse> signUpWithEmail(
    String email,
    String password,
    String numberPhone,
    String userName,
  );
}
