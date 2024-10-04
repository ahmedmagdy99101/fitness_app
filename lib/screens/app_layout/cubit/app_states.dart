

abstract class AppStates{}
class InitialState extends AppStates{}

/// app theme
class LightThemeState extends AppStates {}
class DarkThemeState extends AppStates {}

class ChangeLoginWayState extends AppStates{}
class ChangeBottomNavbarState extends AppStates{}
class ChangeShowBottomSheetState extends AppStates{}
class LoginState extends AppStates{}
class LoginSuccessState extends AppStates{
  final String errorMessage;
  LoginSuccessState(this.errorMessage);
}
class LoginFieldState extends AppStates{
  String? error;
  LoginFieldState({this.error});
}
class RegisterState extends AppStates{}
class RegisterSuccessState extends AppStates{
  final String message;
  RegisterSuccessState(this.message);
}
class RegisterFieldState extends AppStates{}

class ForgetPasswordState extends AppStates{}
class ResetPasswordState extends AppStates{}
class ResetPasswordSuccessState extends AppStates{
  final String Message;
  ResetPasswordSuccessState(this.Message);
}
class ResetPasswordFaildState extends AppStates{}
class ResendCodeSuccessState extends AppStates{}
class ResendCodeFaildState extends AppStates{}

class DeleteAccountState extends AppStates{}
class DeleteAccountSuccessState extends AppStates{
  final String ErrorMessage;
  DeleteAccountSuccessState(this.ErrorMessage);
}
class DeleteAccountFaildState extends AppStates{}
class ClearDoneLoginState extends AppStates{}
class LogoutState extends AppStates{}
class appearRegistrationState extends AppStates{}
class GetComp_infoState extends AppStates{}
class ChangeShowSmallUserInHomeState extends AppStates{}
class ChangeNotCountState extends AppStates{}
class ChangeDirectMessageSeenState extends AppStates{}