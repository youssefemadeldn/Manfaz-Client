class RegexHelper {
  // Regular expressions for different checks
  static final RegExp emailRegex =
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  static final RegExp lowerCaseRegex = RegExp(r'[a-z]');
  static final RegExp upperCaseRegex = RegExp(r'[A-Z]');
  static final RegExp specialCharacterRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  static final RegExp numberRegex = RegExp(r'[0-9]');
  static final RegExp phoneNumberRegex = RegExp(r'^\+?\d{10,15}$');
  static final RegExp urlRegex =
      RegExp(r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$');

  // Method to validate email
  static bool isValidEmail(String email) {
    return emailRegex.hasMatch(email);
  }

  // Method to check for lowercase letters
  static bool hasLowerCase(String input) {
    return lowerCaseRegex.hasMatch(input);
  }

  // Method to check for uppercase letters
  static bool hasUpperCase(String input) {
    return upperCaseRegex.hasMatch(input);
  }

  // Method to check for special characters
  static bool hasSpecialCharacter(String input) {
    return specialCharacterRegex.hasMatch(input);
  }

  // Method to check for numbers
  static bool hasNumber(String input) {
    return numberRegex.hasMatch(input);
  }

  // Method to validate phone number
  static bool isValidPhoneNumber(String phoneNumber) {
    return phoneNumberRegex.hasMatch(phoneNumber);
  }

  // Method to validate URL
  static bool isValidUrl(String url) {
    return urlRegex.hasMatch(url);
  }

  // Method to check for minimum length
  static bool hasMinLength(String input, int minLength) {
    return input.length >= minLength;
  }

  // Method to validate password strength based on multiple conditions
  static bool isValidPassword(String password, {int minLength = 8}) {
    return hasLowerCase(password) &&
        hasUpperCase(password) &&
        hasSpecialCharacter(password) &&
        hasNumber(password) &&
        hasMinLength(password, minLength);
  }
}
