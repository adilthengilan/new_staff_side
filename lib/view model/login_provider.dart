import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  // Private variables to hold login state and user details
  bool _isLoggedIn = false;
  String? _hotelName;
  String? _userName;
  String? _department;
  String? _route;
  String? _checkInTime;
  String? _checkOutTime;
  String? _date;

  // Public getters to access private variables
  bool get isLoggedIn => _isLoggedIn;
  String? get hotelName => _hotelName;
  String? get userName => _userName;
  String? get department => _department;
  String? get route => _route;
  String? get checkInTime => _checkInTime;
  String? get checkOutTime => _checkOutTime;
  String? get date => _date;

  // Method to log in the user (do not save details)
  Future<void> logIn({
    required String hotelName,
    required String userName,
    required String department,
    String checkInTime = '',
    String checkOutTime = '',
    String date = '',
  }) async {
    _isLoggedIn = true;
    _hotelName = hotelName;
    _userName = userName;
    _department = department;
    _route = 'Admin/staffportal/$department/$userName';
    _checkInTime = checkInTime;
    _checkOutTime = checkOutTime;
    _date = date;
    notifyListeners(); // Notify listeners to update the UI

    // Clear login details from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('hotelName');
    await prefs.remove('userName');
    await prefs.remove('department');
    await prefs.remove('route');
    await prefs.remove('checkInTime');
    await prefs.remove('checkOutTime');
    await prefs.remove('date');
    await prefs.setBool('isLoggedIn', _isLoggedIn);
  }

  // Method to log out the user and clear login details from SharedPreferences
  Future<void> logOut() async {
    _isLoggedIn = false;
    _hotelName = null;
    _userName = null;
    _department = null;
    _route = null;
    _checkInTime = null;
    _checkOutTime = null;
    _date = null;
    notifyListeners(); // Notify listeners to update the UI

    // Clear login details from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('hotelName');
    await prefs.remove('userName');
    await prefs.remove('department');
    await prefs.remove('route');
    await prefs.remove('checkInTime');
    await prefs.remove('checkOutTime');
    await prefs.remove('date');
    await prefs.setBool('isLoggedIn', _isLoggedIn);
  }

  // Method to load login details from SharedPreferences when the app starts
  Future<void> loadLoginDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    _hotelName = prefs.getString('hotelName');
    _userName = prefs.getString('userName');
    _department = prefs.getString('department');
    _route = prefs.getString('route');
    _checkInTime = prefs.getString('checkInTime');
    _checkOutTime = prefs.getString('checkOutTime');
    _date = prefs.getString('date');
    notifyListeners(); // Notify listeners to update the UI
  }

  // Private variable to track new requests
  bool _hasNewRequest = false;

  // Public getter to access the new request status
  bool get hasNewRequest => _hasNewRequest;

  // Method to add a new request and notify listeners
  void addNewRequest() {
    _hasNewRequest = true;
    notifyListeners(); // Notify listeners to update the UI
  }

  // Method to clear the request status and notify listeners
  void clearRequest() {
    _hasNewRequest = false;
    notifyListeners(); // Notify listeners to update the UI
  }
}
