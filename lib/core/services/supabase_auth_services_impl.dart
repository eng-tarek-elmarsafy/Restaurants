import 'package:restaurants/core/services/auth_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthEmailServicesImpl implements AuthEmailServices {
  final supabase = Supabase.instance.client;

  @override
  Future<AuthResponse> signUpWithEmail(
    String email,
    String password,
    String numberPhone,
    String userName,
  ) async {
    AuthResponse respons = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {'numberPhone': numberPhone, 'userName': userName},
    );
    return respons;
  }
}
