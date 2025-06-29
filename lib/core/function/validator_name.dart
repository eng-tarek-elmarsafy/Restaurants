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