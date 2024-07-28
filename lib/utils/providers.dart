import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuchtrip_staff_portal/view/Dashboard/dashboard.dart';
import 'package:tuchtrip_staff_portal/view/Registration/signUp_screen.dart';

List<ChangeNotifierProvider<ChangeNotifier>> providers = [
  ChangeNotifierProvider<FormStateNotifier>(create: (context) => FormStateNotifier()),

];
