import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuchtrip_staff_portal/view%20model/login_provider.dart';
import 'package:tuchtrip_staff_portal/view%20model/request_provider.dart';
import 'package:tuchtrip_staff_portal/view%20model/restuarent%20provider.dart';
import 'package:tuchtrip_staff_portal/view/Registration/signUp_screen.dart';

List<ChangeNotifierProvider<ChangeNotifier>> providers = [
  ChangeNotifierProvider<RequestProvider>(
      create: (context) => RequestProvider()),
  ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider()),
  ChangeNotifierProvider<OrderProvider>(create: (context) => OrderProvider()),
];
