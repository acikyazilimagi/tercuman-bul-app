import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:nylo_framework/nylo_framework.dart';

class FirebaseAuthUiLabelOverrides extends DefaultLocalizations {
  const FirebaseAuthUiLabelOverrides();

  @override
  String get emailInputLabel => "email".tr();

  @override
  String get passwordInputLabel => "passwordInputLabel".tr();

  @override
  String get signInText => "signInText".tr();

  @override
  String get forgotPasswordHintText => "forgotPasswordHintText".tr();

  @override
  String get registerHintText => "registerHintText".tr();

  @override
  String get registerText => "registerText".tr();

  @override
  String get forgotPasswordButtonLabel => "${"forgotPassword".tr()}?";

  @override
  String get forgotPasswordViewTitle => "forgotPassword".tr();

  @override
  String get resetPasswordButtonLabel => "resetPassword".tr();

  @override
  String get goBackButtonLabel => "goBack".tr();

  @override
  String get userNotFoundErrorText => "accountDoesNotExist".tr();

  @override
  String get passwordResetEmailSentText => "passwordResetEmailSentText".tr();

  @override
  String get passwordIsRequiredErrorText => "passwordIsRequiredErrorText".tr();

  @override
  String get confirmPasswordIsRequiredErrorText =>
      "confirmPasswordIsRequiredErrorText".tr();

  @override
  String get confirmPasswordDoesNotMatchErrorText =>
      "confirmPasswordDoesNotMatchErrorText".tr();

  @override
  String get confirmPasswordInputLabel => "confirmPasswordInputLabel".tr();

  @override
  String get emailIsRequiredErrorText => "emailIsRequiredErrorText".tr();

  @override
  String get isNotAValidEmailErrorText => "isNotAValidEmailErrorText".tr();

  @override
  String get emailTakenErrorText => "emailTakenErrorText".tr();

  @override
  String get accessDisabledErrorText => "accessDisabledErrorText".tr();

  @override
  String get provideEmail => "Provide your email and password";

  @override
  String get registerActionText => "registerText".tr();

  @override
  String get signInActionText => "signInText".tr();

  @override
  String get signInHintText => "signInHintText".tr();

  @override
  String get signInWithGoogleButtonText => "Sign in with Google";

  @override
  String get unknownError => "unknownError".tr();

  @override
  String get wrongOrNoPasswordErrorText => "wrongOrNoPasswordErrorText".tr();
}
