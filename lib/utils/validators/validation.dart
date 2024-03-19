class AppValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName не может быть пустым';
    }

    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email не может быть пустым';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if(!emailRegex.hasMatch(email)) {
      return 'Некорректный email';
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Пароль не может быть пустым';
    }

    if (password.length < 6) {
      return 'Пароль должен содержать не менее 6 символов';
    }

    if(!password.contains(RegExp(r'[A-Z]'))) {
      return 'Пароль должен содержать хотя бы одну заглавную букву';
    }

    if(!password.contains(RegExp(r'[0-9]'))) {
      return 'Пароль должен содержать хотя бы одну цифру';
    }

    if(!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Пароль должен содержать хотя бы один специальный символ';
    }

    return null;
  }

  static String? validatePhoneNumber(String? number) {
    if (number == null || number.isEmpty) {
      return 'Номер не может быть пустым';
    }

    final phoneNumberRegex = RegExp(r'^\d{11}$');

    if(!phoneNumberRegex.hasMatch(number)) {
      return 'Некорректный номер';
    }

    return null;
  }
}