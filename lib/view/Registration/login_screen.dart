import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuchtrip_staff_portal/utils/app_colors.dart';
import 'package:tuchtrip_staff_portal/utils/text_styles.dart';
import 'package:tuchtrip_staff_portal/view%20model/login_provider.dart';
import 'package:tuchtrip_staff_portal/view/Bottom%20Navigation%20Bar/bottom_navigation_bar.dart';
import 'package:tuchtrip_staff_portal/view/Common%20Widget/app_textButton.dart';
import 'package:tuchtrip_staff_portal/view/Common%20Widget/app_textfield.dart';
import 'package:tuchtrip_staff_portal/view/Registration/signUp_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // Controllers for text fields
  final TextEditingController hotelNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

  // List of available departments
  final List<String> departments = ['Bellboys', 'Laundry', 'Restaurant'];
  //***************************************************************************************************************************** */
  // Function to handle login
  void _login(BuildContext context) {
    String hotelName = hotelNameController.text.trim();
    String userName = userNameController.text.trim();
    String department = departmentController.text.trim();

    if (hotelName.isNotEmpty && userName.isNotEmpty && department.isNotEmpty) {
      int departmentIndex = _getDepartmentIndex(department);

      // Log in using the LoginProvider
      Provider.of<LoginProvider>(context, listen: false)
          .logIn(hotelName, userName, department);

      // Navigate to the appropriate dashboard based on department
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              CustomBottomNavigationBar(departmentIndex: departmentIndex),
        ),
      );
    } else {
      // Show error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the fields')),
      );
    }
  }
  //***************************************************************************************************************************** */

  // Helper function to get department index based on department name
  int _getDepartmentIndex(String department) {
    switch (department.toLowerCase()) {
      case 'bellboys':
        return 0;
      case 'laundry':
        return 1;
      case 'restaurant':
        return 2;
      default:
        return 0; // default to 0 if the department doesn't match
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBox(height * 0.17, width),
            // Welcome text
            Text(
              'Welcome Back!',
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            // Subtitle text
            Text(
              'Sign in to continue!',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 178, 177, 177),
              ),
            ),
            sizedBox(height * 0.06, width),
            // Hotel Name input field
            AppTextField(
              controller: hotelNameController,
              hintText: "Hotel Name",
              height: height,
              width: width,
            ),
            sizedBox(height * 0.02, width),
            // User Name input field
            AppTextField(
              controller: userNameController,
              hintText: "User Name",
              height: height,
              width: width,
            ),
            sizedBox(height * 0.02, width),
            // Department dropdown field
            Container(
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: width * 0.06),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color.fromARGB(255, 206, 206, 206),
                ),
              ),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Select Department',
                  hintStyle: GoogleFonts.montserrat(
                      fontSize: 17,
                      color: greyShadeLight,
                      fontWeight: FontWeight.w600),
                  contentPadding: EdgeInsets.only(left: 20, top: 10),
                ),
                value: departments.contains(departmentController.text)
                    ? departmentController.text
                    : null,
                onChanged: (String? newValue) {
                  departmentController.text = newValue ?? '';
                },
                items: departments.map((String department) {
                  return DropdownMenuItem<String>(
                    value: department,
                    child: Text(
                      department,
                      style: smallgreyTextStyle,
                    ),
                  );
                }).toList(),
              ),
            ),
            // Use Email button
            Padding(
              padding: EdgeInsets.only(right: width * 0.04),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Use Email",
                    style: smallblueTextStyle,
                  ),
                ),
              ),
            ),
            sizedBox(height * 0.06, width),
            AppTextButton(
              text: "Sign In",
              onPressed: () => _login(context),
              height: height,
              width: width,
            ),
            sizedBox(height * 0.04, width),
            // Sign Up prompt
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: smallTextStyle,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupScreen(),
                      ),
                    );
                  },
                  child: Text(
                    ' Sign Up',
                    style: smallblueTextStyle,
                  ),
                ),
              ],
            ),
            sizedBox(height * 0.10, width),
          ],
        ),
      ),
    );
  }
}

Widget sizedBox(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}
