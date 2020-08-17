import 'package:dashboarduidesign/Providers/ApiProvider.dart';

class Repository {
  ApiProvider apiProvider = ApiProvider();

  //Login
  Future<String> checkLogin(var contact, var password) =>
      apiProvider.checkLogin(contact, password);
  //Change Password Get Contact
  Future<String> changePasswordGetContact(var contact) =>
      apiProvider.changePasswordGetContact(contact);
  //Change Password Verify OTP
  Future<String> changePasswordVerifyOTP(var contact, var otp) =>
      apiProvider.changePasswordVerifyOTP(contact, otp);
  //Change Password Confirmation
  Future<String> changePasswordConfirmation(var contact, var password) =>
      apiProvider.changePasswordConfirmation(contact, password);

      Future<String> addEmergencyDetails(var title, var emergencyNumber, var latitude, var longitude) =>
      apiProvider.addEmergencyDetails(title, emergencyNumber, latitude, longitude);

      Future<List>getEmergencyDetails()=>apiProvider.getEmergencyDetails();
}
