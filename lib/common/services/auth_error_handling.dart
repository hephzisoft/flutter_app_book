String checkError(String errorMessage) {
  String message = 'An error occurred';
  switch (errorMessage) {
    case 'user-not-found':
      message = 'User account is not found';
      break;
    case 'invalid-email':
      message = 'The email is invalid';
      break;

    case 'weak-password':
      message = "Your password is weak";
      break;

    case 'wrong-password':
      message = 'Wrong password';
      break;

  }
  return message;
}
