import 'package:supabase_flutter/supabase_flutter.dart';

abstract class Failure {
  Failure({required this.message});

  final String message;
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}

class EmailConfirmationPendingFailure extends Failure {
  EmailConfirmationPendingFailure({required super.message});
}


class AuthExceptionHandler extends Failure {
  AuthExceptionHandler({required super.message});

  static String handleException(dynamic e) {
    if (e is AuthApiException) {
      return _handleAuthApiException(e);
    } else if (e is AuthException) {
      return "حصل خطأ في عملية المصادقة، حاول تاني.";
    } else {
      return "حصل خطأ غير متوقع، حاول تاني.";
    }
  }

  static String _handleAuthApiException(AuthApiException e) {
    switch (e.code) {
      case 'invalid_credentials':
        return "الإيميل أو كلمة السر غير صحيحة.";
      case 'email_not_confirmed':
        return "الإيميل مش مُفعل، من فضلك فعل الإيميل الأول.";
      case 'user_not_found':
        return "المستخدم غير موجود.";
      case 'weak_password':
        return "كلمة السر ضعيفة جدًا.";
      case 'user_already_exists':
        return "الإيميل ده مستخدم بالفعل.";
      case 'invalid_email':
        return "الإيميل المدخل غير صحيح.";
      default:
        return e.message.isNotEmpty
            ? e.message
            : "حصل خطأ أثناء عملية التسجيل / تسجيل الدخول.";
    }
  }
}
