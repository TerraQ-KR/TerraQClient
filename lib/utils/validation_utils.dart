class ValidateUtils {
  String? validateEmail(value) {
    if (value.isEmpty) {
      return 'Email cannot be empty.';
    }
  }

  String? validatePassword(value) {
    if (value.isEmpty) {
      return 'Password cannot be empty.';
    } else {
      RegExp regExp = RegExp(
          r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,}$');
      if (!regExp.hasMatch(value)) {
        return 'Password must be greater than 8 characters.';
      }
    }
  }

  String? validateConfirmPassword(value, password) {
    if (value.isEmpty) {
      return 'Password cannot be empty.';
    } else if (value != password) {
      return 'Password does not match.';
    }
  }

  String? validateName(value) {
    if (value.isEmpty) {
      return 'User name cannot be empty.';
    }
  }
}
