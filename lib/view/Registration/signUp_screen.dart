import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuchtrip_staff_portal/utils/app_colors.dart';
import 'package:tuchtrip_staff_portal/utils/text_styles.dart';
import 'package:tuchtrip_staff_portal/view%20model/login_provider.dart';
import 'package:tuchtrip_staff_portal/view/Bottom%20Navigation%20Bar/bottom_navigation_bar.dart';
import 'package:tuchtrip_staff_portal/view/Common%20Widget/app_textButton.dart';
import 'package:tuchtrip_staff_portal/view/Common%20Widget/app_textfield.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController hotelNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

  final List<String> departments = [
    'Bellboys',
    'Laundry',
    'Restaurant',
    'Reception',
    'Spa & Gym',
    'HR and PR',
    'Transportation + GPS',
    'Maintenance',
    'House Keeping',
    'Accountant'
  ];

  void _signUp(BuildContext context) {
  String hotelName = hotelNameController.text.trim();
  String userName = userNameController.text.trim();
  String department = departmentController.text.trim();

  if (hotelName.isNotEmpty && userName.isNotEmpty && department.isNotEmpty) {
    int departmentIndex = _getDepartmentIndex(department);

    // Sign up using the LoginProvider
    Provider.of<LoginProvider>(context, listen: false).logIn(
      hotelName: hotelName,
      userName: userName,
      department: department,
      checkInTime: '', // Provide default value or empty string
      checkOutTime: '', // Provide default value or empty string
      date: '', // Provide default value or empty string
    );

    // Navigate to the appropriate dashboard based on department
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CustomBottomNavigationBar(departmentIndex: departmentIndex),
      ),
    );
  } else {
    // Show error message if any field is empty
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please fill all the fields')),
    );
  }
}


  int _getDepartmentIndex(String department) {
    switch (department.toLowerCase()) {
      case 'bellboys':
        return 0;
      case 'laundry':
        return 1;
      case 'restaurant':
        return 2;
      case 'reception':
        return 3;
      case 'spa & gym':
        return 4;
      case 'hr and pr':
        return 5;
      case 'transportation + gps':
        return 6;
      case 'maintenance':
        return 7;
      case 'house keeping':
        return 8;
      case 'accountant':
        return 9;
      default:
        return 0; // default to 0 if the department doesn't match
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBox(height * 0.17, width), // Spacer at the top
            Text(
              'Create Account',
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Text(
              'Sign up to get started!',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: const Color.fromARGB(255, 178, 177, 177),
              ),
            ),
            sizedBox(height * 0.06, width), // Spacer
            // Input field for hotel name
            AppTextField(
              controller: hotelNameController,
              hintText: "Hotel Name",
              height: height,
              width: width,
            ),
            sizedBox(height * 0.02, width), // Spacer
            // Input field for user name
            AppTextField(
              controller: userNameController,
              hintText: "User Name",
              height: height,
              width: width,
            ),
            sizedBox(height * 0.02, width), // Spacer
            // Dropdown for selecting department
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
                  contentPadding: const EdgeInsets.only(left: 20, top: 10),
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
            sizedBox(height * 0.06, width), // Spacer
            // Sign up button
            AppTextButton(
              text: "Sign Up",
              onPressed: () => _signUp(context),
              height: height,
              width: width,
            ),
            sizedBox(height * 0.04, width), // Spacer
            // Sign in prompt
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: smallTextStyle,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    ' Sign In',
                    style: smallblueTextStyle,
                  ),
                ),
              ],
            ),
            sizedBox(height * 0.10, width), // Spacer at the bottom
          ],
        ),
      ),
    );
  }
}

// Helper function for creating a SizedBox widget
Widget sizedBox(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}
