class ValidateUtils {
  String? validateEmail(value) {
    if (value.isEmpty) {
      return 'Email cannot be empty.';
    } else {
      RegExp regExp = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if (!regExp.hasMatch(value)) {
        return 'Please enter a valid email.';
      }
    }
    return null;
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
    // ignore: newline-before-return
    return null;
  }

  String? validateConfirmPassword(value, password) {
    if (value.isEmpty) {
      return 'Password cannot be empty.';
    } else if (value != password) {
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
