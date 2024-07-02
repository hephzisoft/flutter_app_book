

String? passwordValidator(String? value) {
  if (value != null) {
    if (value.length < 8) {
      return 'Password must not be less than 8';
    }
  } else {
    return 'Password cannot be empty';
  }
  return null;
}

String? emailValidator(String? value) {
  if (value != null) {
    if (!value.contains('@')) {
      return 'Incorrect email format';
    }
  } else {
    return 'Email cannot be empty';
  }
  return null;
}
