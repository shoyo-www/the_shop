import 'package:form_field_validator/form_field_validator.dart';

class Validator {

  static var passwordValidate = MultiValidator([
    RequiredValidator(errorText: "Please enter password."),
  ]);

  static var passwordOldValidate = MultiValidator([
    RequiredValidator(errorText: "Please enter old password."),
    PatternValidator(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])', errorText: "Password must be 8-12 characters long, and contain at least 1 uppercase, 1 lowercase, 1 number and 1 special character."),
  ]);

  static var passwordNewValidate = MultiValidator([
    RequiredValidator(errorText: "Please enter New password."),
    PatternValidator(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])', errorText: "Password must be 8-12 characters long, and contain at least 1 uppercase, 1 lowercase, 1 number and 1 special character."),
  ]);

  static var passwordConfirmValidate = MultiValidator([
    RequiredValidator(errorText: "Please enter confirm password."),
    PatternValidator(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])', errorText: "Password must be 8-12 characters long, and contain at least 1 uppercase, 1 lowercase, 1 number and 1 special character."),
  ]);

  static var emailValidate = MultiValidator([
    RequiredValidator(errorText: 'Please enter an email address'),
    PatternValidator(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      errorText: 'Please enter a valid email address',
    ),
  ]);

  static var otpValidate = MultiValidator([
    RequiredValidator(errorText: 'Please enter OTP'),
    PatternValidator(r'^\d{4}$', errorText: "Phone number must be 4 digits")
  ]);
  static var fullName = MultiValidator([
    RequiredValidator(errorText: 'Please enter FullName'),
  ]);
}