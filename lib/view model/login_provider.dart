// Mock Authentication State Class
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
//------------------------------------------------------ current staff -----------------------------------------------------------
  //  Staff? _currentStaff;

  // Staff? get currentStaff => _currentStaff;

  // void setCurrentStaff(Staff staff) {
  //   _currentStaff = staff;
  //   notifyListeners();
  // }
//----------------------------------------------------------------------------------------------------------------------------------
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void logIn(String hotelName, String userName, String department) {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logOut() {
    _isLoggedIn = false;
    notifyListeners();
  }


  //======================================== Users Request for room service====================================
  bool _hasNewRequest = false;

  bool get hasNewRequest => _hasNewRequest;

  void addNewRequest() {
    _hasNewRequest = true;
    notifyListeners();
  }

  void clearRequest() {
    _hasNewRequest = false;
    notifyListeners();
  }

}


