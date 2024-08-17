import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuchtrip_staff_portal/utils/app_colors.dart';
import 'package:tuchtrip_staff_portal/view%20model/login_provider.dart';
import 'package:tuchtrip_staff_portal/view/Bottom%20Navigation%20Bar/bottom_navigation_bar.dart';
import 'package:tuchtrip_staff_portal/view/Registration/login_screen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay navigation to the next screen by 5 seconds
    Future.delayed(const Duration(seconds: 5), () async {
      // Access the LoginProvider to check login status
      final loginProvider = Provider.of<LoginProvider>(context, listen: false);

      // Load login details from SharedPreferences
      // await loginProvider.loadLoginDetails();

      // Check if the user is logged in
      if (loginProvider.isLoggedIn) {
        // Get the department index based on the logged-in user's department
        final departmentIndex = getDepartmentIndex(loginProvider.department);
        // Navigate to the CustomBottomNavigationBar with the appropriate department index
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CustomBottomNavigationBar(
              departmentIndex: departmentIndex,
            ),
          ),
        );
      } else {
        // Navigate to the LoginScreen if the user is not logged in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }
    });

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor, // Set the background color of the splash screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the splash screen image
            Container(
              height: height * 0.50,
              width: width * 0.50,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    "assests/images/Screenshot 2024-07-29 113915.png",
                  ),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to get the department index based on the department name
  int getDepartmentIndex(String? department) {
    switch (department) {
      case 'bellboys':
        return 0;
      case 'laundry':
        return 1;
      case 'restaurant':
        return 2;
      // Add other departments as needed
      default:
        return 0;
    }
  }
}
