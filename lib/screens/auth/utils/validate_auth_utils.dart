class ValidateAuthUtils {
  String? validateEmail(value) {
    RegExp regEmail = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regEmail.hasMatch(value)) {
      return 'Enter a valid email';
    }

    return null;
  }

  String? validatePassword(value) {
    RegExp regPassword = RegExp(
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,}$');
    if (!regPassword.hasMatch(value)) {
      return 'Enter a valid password\n[minimum 8 character, 1 number, 1 special character]';
    }

    return null;
  }

  String? validateConfirmPassword(value, password) {
    if (value != password) {
      return 'Password does not match.';
    }

    return null;
  }

  String? validateName(value) {
    if (value.isEmpty) {
      return 'User name cannot be empty.';
    }

    return null;
  }
}
