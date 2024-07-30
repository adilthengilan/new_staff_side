import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuchtrip_staff_portal/utils/app_colors.dart';
import 'package:tuchtrip_staff_portal/view%20model/login_provider.dart';
import 'package:tuchtrip_staff_portal/view/Bottom%20Navigation%20Bar/bottom_navigation_bar.dart';
import 'package:tuchtrip_staff_portal/view/Dashboard/bellboys_dashboard.dart';
import 'package:tuchtrip_staff_portal/view/Registration/login_screen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      bool isLoggedIn =
          Provider.of<LoginProvider>(context, listen: false).isLoggedIn;
      if (isLoggedIn) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CustomBottomNavigationBar(
                    departmentIndex: 3,
                  )),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * 0.50,
              width: width * 0.50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/Screenshot 2024-07-29 113915.png"),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
