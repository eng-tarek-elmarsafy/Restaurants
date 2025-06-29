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