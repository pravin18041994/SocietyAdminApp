import 'package:dashboarduidesign/Utilities/Constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  //send message
  Future<String> sendMessage(var subject, var message, var sendTo) async {
    var token;
    var storage = FlutterSecureStorage();
    token = await storage.read(key: 'token');
    http.Response response = await http.post(Constants.BASE_URL + '',
        body: {'subject': subject, 'message': message, 'sendTo': sendTo},
        headers: {'Authorization': 'Bearer ' + token});
    print(response.body);
    var decodedResponse = json.decode(response.body);
    if (decodedResponse['state'] == 'success') {
      return "success";
    } else {
      return "fail";
    }
  }

  //get complaints/requests
  Future<List> getComplaints() async {
    var token;
    var storage = FlutterSecureStorage();
    token = await storage.read(key: 'token');
    http.Response response = await http.get(Constants.BASE_URL + "",
        headers: {'Authorization': 'Bearer ' + token});
    print(response.body);
    var decodedResponse = json.decode(response.body);
    if (decodedResponse['state'] == 'success') {
      return decodedResponse['data'];
    } else {
      return [];
    }
  }

  //get polls
  Future<List> getPolls() async {
    var token;
    var storage = FlutterSecureStorage();
    token = await storage.read(key: 'token');
    http.Response response = await http.get(Constants.BASE_URL + "",
        headers: {'Authorization': 'Bearer ' + token});
    print(response.body);
    var decodedResponse = json.decode(response.body);
    if (decodedResponse['state'] == 'success') {
      return decodedResponse['data'];
    } else {
      return [];
    }
  }

  //get property maintenance bills
  Future<List> getPropertyMaintenanceBills() async {
    var token;
    var storage = FlutterSecureStorage();
    token = await storage.read(key: 'token');
    http.Response response = await http.get(Constants.BASE_URL + "",
        headers: {'Authorization': 'Bearer ' + token});
    print(response.body);
    var decodedResponse = json.decode(response.body);
    if (decodedResponse['state'] == 'success') {
      return decodedResponse['data'];
    } else {
      return [];
    }
  }

//schedule a meeting
  Future<String> scheduleMeeting(var meetingTiming, var meetingPlace) async {
    var token;
    var storage = FlutterSecureStorage();
    token = await storage.read(key: 'token');
    http.Response response = await http.post(Constants.BASE_URL + '',
        body: {'timing': meetingTiming, 'place': meetingPlace},
        headers: {'Authorization': 'Bearer ' + token});
    print(response.body);
    var decodedResponse = json.decode(response.body);
    if (decodedResponse['state'] == 'success') {
      return "success";
    } else {
      return "fail";
    }
  }

  //get profile data
  Future<List> getProfileData() async {
    var token;
    var storage = FlutterSecureStorage();
    token = await storage.read(key: 'token');
    http.Response response = await http.get(Constants.BASE_URL + '',
        headers: {'Authorization': 'Bearer ' + token});
    print(response.body);
    var decodedResponse = json.decode(response.body);
    if (decodedResponse['state'] == 'success') {
      return decodedResponse['data'];
    } else {
      return [];
    }
  }

  //add property maintenance bill
  Future<String> addPropertyMaintenanceBill(
      var issue, var date, var comment, var imageFile) async {
    var request = http.MultipartRequest("POST", Uri.parse("<url>"));
    var pic = await http.MultipartFile.fromPath("file", imageFile.path);
    request.fields['issue'] = issue;
    request.fields['date'] = date;
    request.fields['comment'] = comment;
    request.files.add(pic);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
  }

  //Login API
  Future<String> checkLogin(var contact, var password) async {
    print(contact);
    print(password);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    http.Response response = await http.post(
        Constants.BASE_URL + 'admins/login',
        body: {'contact': contact, 'password': password});
    print(response.body);
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      if (decodedResponse['state'] == 'success') {
        var storage = new FlutterSecureStorage();
        await storage.write(key: "token", value: decodedResponse['token']);
        await sharedPreferences.setString("name", decodedResponse['name']);
        await sharedPreferences.setString("id", decodedResponse['id']);
        return "success";
      } else {
        return decodedResponse['msg'];
      }
    } else {
      throw Exception('Cannot perform the operation !');
    }
  }

  //Change Password ( Get Contact ) API
  Future<String> changePasswordGetContact(var contact) async {
    print(contact);
    http.Response response = await http.post(
        Constants.BASE_URL + 'secretaries/get_contact_update_password',
        body: {
          'contact': contact,
        });
    print(response.body);
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      if (decodedResponse['state'] == 'success') {
        return 'success';
      } else {
        return decodedResponse['msg'];
      }
    } else {
      throw Exception('Cannot perform the operation !');
    }
  }

  //Change Password ( Verify OTP ) API
  Future<String> changePasswordVerifyOTP(var contact, var otp) async {
    print(contact);
    print(otp);
    http.Response response = await http.post(
        Constants.BASE_URL + 'secretaries/verify_otp_update_password',
        body: {'contact': contact, 'otp': otp});
    print(response.body);
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      if (decodedResponse['state'] == 'success') {
        return 'success';
      } else {
        return decodedResponse['msg'];
      }
    } else {
      throw Exception('Cannot perform the operation !');
    }
  }

  //Confirm Password API
  Future<String> changePasswordConfirmation(var contact, var password) async {
    print(contact);
    http.Response response = await http.post(
        Constants.BASE_URL + 'secretaries/update_password',
        body: {'contact': contact, 'password': password});
    print(response.body);
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      if (decodedResponse['state'] == 'success') {
        return 'success';
      } else {
        return decodedResponse['msg'];
      }
    } else {
      throw Exception('Cannot perform the operation !');
    }
  }

  getProfileDetails() async {
    var token;
    var storage = FlutterSecureStorage();
    token = await storage.read(key: "token");
    print(token);
    http.Response response = await http.get(
        Constants.BASE_URL + 'students/get_a_particular_student',
        headers: {'Authorization': 'Bearer ' + token});
    print(response.body);
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      if (decodedResponse['state'] == 'success') {
        return decodedResponse['data'];
      } else {
        return [];
      }
    } else {
      throw Exception('Cannot perform the operation !');
    }
  }

  addEmergencyDetails(
      var title, var emergencyNumber, var latitude, var longitude) async {
    var token;
    var storage = FlutterSecureStorage();
    token = await storage.read(key: "token");
    print(token);
    http.Response response = await http.post(Constants.BASE_URL + '', body: {
      'title': title,
      'emergency_no': emergencyNumber,
      'latitude': latitude,
      'longitude': longitude
    }, headers: {
      'Authorization': 'Bearer ' + token
    });
    print(response.body);
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      if (decodedResponse['state'] == 'success') {
        return decodedResponse['data'];
      } else {
        return [];
      }
    } else {
      throw Exception('Cannot perform the operation !');
    }
  }

  Future<List> getEmergencyDetails() async {
    var token;
    var storage = FlutterSecureStorage();
    token = await storage.read(key: "token");
    print(token);
    http.Response response = await http.get(Constants.BASE_URL + '',
        headers: {'Authorization': 'Bearer ' + token});
    print(response.body);
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      if (decodedResponse['state'] == 'success') {
        return decodedResponse['data'];
      } else {
        return [];
      }
    } else {
      throw Exception('Cannot perform the operation !');
    }
  }
}
