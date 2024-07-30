import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuchtrip_staff_portal/utils/providers.dart';
import 'package:tuchtrip_staff_portal/view/Bottom%20Navigation%20Bar/bottom_navigation_bar.dart';
import 'package:tuchtrip_staff_portal/view/Dashboard/bellboys_dashboard.dart';
import 'package:tuchtrip_staff_portal/view/Registration/login_screen.dart';
import 'package:tuchtrip_staff_portal/view/Registration/signUp_screen.dart';
import 'package:tuchtrip_staff_portal/view/Room%20Service/room_service.dart';
import 'package:tuchtrip_staff_portal/view/Splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: Splash()),
    );
  }
}
