import 'package:restaurants/core/failure/failure.dart';
import 'package:restaurants/core/services/auth_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthEmailServicesImpl implements AuthEmailServices {
  final supabase = Supabase.instance.client;

  @override
  Future<User> signUpWithEmail(
    String email,
    String password,
    String numberPhone,
    String userName,
  ) async {
    AuthResponse response = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {'numberPhone': numberPhone, 'userName': userName},
    );
    if (response.session == null) {
      throw EmailConfirmationPendingFailure(
        message: ' من فضلك فعّل البريد الإلكتروني من الرابط اللي وصلك',
      );
    }
    return response.user!;
  }

  @override
  Future<User> signInWithEmail(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(
      password: password,
      email: email,
    );

    if (response.session == null) {
      throw EmailConfirmationPendingFailure(
        message: 'فشل تسجيل الدخول أو الإيميل لسه متأكدش',
      );
    }
    return response.user!;
  }

  @override
  Future<void> forgotPassword(String email) async {
    await supabase.auth.resetPasswordForEmail(email);
  }
}
