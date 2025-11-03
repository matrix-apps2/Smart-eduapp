class EndPoints {
  static const String baseUrl = "https://dev02.matrix-clouds.com/oun/public/api";

  static const String login = "/provider/login";
  static const String register = "/provider/register";
  static const String sendOTP = "/provider/send-otp";
  static const String verifyAccount = "/provider/verify_account";
  static const String forgetPassword = "/provider/forget_password";
  static const String changePassword = "/provider/change-password";
  static const String resetPassword = "/provider/reset_password";
  static const String profile = "/provider/profile";
  static const String updateProfile = "/provider/update-profile";
  static const String deleteAccount = "/provider/change-password";

  static const String settings = "/v1/account/settings";

  static const String getNotifications = "/provider/notifications";
  static const String markNotificationAsSeen = "/provider/notification/seen";

  //* Location
  static const String countries = "/countries";
  static const String termsAndConditions = "/pages/terms_and_conditions";
}
