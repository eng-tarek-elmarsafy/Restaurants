String? validatorName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'من فضلك ادخل الأسم';
  } else if (value.trim().length < 2) {
    return 'الاسم قصير جداً';
  }

  final nameRegex = RegExp(r'^[\p{L} ]+$', unicode: true);
  if (!nameRegex.hasMatch(value.trim())) {
    return 'الأسم غير صالح';
  }

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'من فضلك أدخل كلمة المرور';
  }

  if (value.length < 8) {
    return 'كلمة المرور يجب أن تكون على الأقل 8 أحرف';
  }

  final hasUppercase = value.contains(RegExp(r'[A-Z]'));
  final hasLowercase = value.contains(RegExp(r'[a-z]'));
  final hasDigit = value.contains(RegExp(r'[0-9]'));
  final hasSpecialChar = value.contains(RegExp(r'[!@#\$&*~]'));

  if (!hasUppercase) {
    return 'كلمة المرور يجب أن تحتوي على حرف كبير واحد على الأقل (A-Z)';
  }

  if (!hasLowercase) {
    return 'كلمة المرور يجب أن تحتوي على حرف صغير واحد على الأقل (a-z)';
  }

  if (!hasDigit) {
    return 'كلمة المرور يجب أن تحتوي على رقم واحد على الأقل';
  }

  if (!hasSpecialChar) {
    return 'كلمة المرور يجب أن تحتوي على رمز خاص مثل (!@#\$&*~)';
  }

  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'من فضلك أدخل البريد الإلكتروني';
  }

  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
  if (!emailRegex.hasMatch(value)) {
    return 'البريد الإلكتروني غير صالح';
  }

  return null;
}

String? validatorPhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'من فضلك أدخل رقم التليفون';
  }

  final phoneRegExp = RegExp(r'^(01)[0-9]{9}$');
  if (!phoneRegExp.hasMatch(value)) {
    return 'رقم التليفون غير صحيح';
  }

  return null;
}
