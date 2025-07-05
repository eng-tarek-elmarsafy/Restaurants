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
    AuthResponse respons = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {'numberPhone': numberPhone, 'userName': userName},
    );
    if (respons.session == null) {
      throw EmailConfirmationPendingFailure(
        message: ' من فضلك فعّل البريد الإلكتروني من الرابط اللي وصلك',
      );
    }
    return respons.user!;
  }

  @override
  Future<User> signInWithEmail(String email, String password) async {
    final respons = await supabase.auth.signInWithPassword(
      password: password,
      email: email,
    );

    if (respons.session == null) {
      throw EmailConfirmationPendingFailure(
        message: 'فشل تسجيل الدخول أو الإيميل لسه متأكدش',
      );
    }
    return respons.user!;
  }
}
