import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuchtrip_staff_portal/utils/app_colors.dart';
import 'package:tuchtrip_staff_portal/utils/text_styles.dart';
import 'package:tuchtrip_staff_portal/view%20model/login_provider.dart';
import 'package:tuchtrip_staff_portal/view/Bottom%20Navigation%20Bar/bottom_navigation_bar.dart';
import 'package:tuchtrip_staff_portal/view/Common%20Widget/app_textButton.dart';
import 'package:tuchtrip_staff_portal/view/Common%20Widget/app_textfield.dart';
import 'package:tuchtrip_staff_portal/view/Registration/signUp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Text controllers to retrieve user input---------------------------------------------
  final TextEditingController hotelNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  String? selectedDepartment;

  // List of departments for the dropdown------------------------------------------------
  final List<String> departments = [
    'Bellboys',
    'Laundry',
    'Restaurant',
    'Spa & Gym',
    'Transportation + GPS',
    'Maintenance',
    'House Keeping',
  ];

  // Method to handle login process-------------------------------------------------------
  void _login(BuildContext context) {
    // Get trimmed input from text fields
    String hotelName = hotelNameController.text.trim();
    String userName = userNameController.text.trim();
    String department = selectedDepartment ?? '';

    // Ensure all fields are filled
    if (hotelName.isNotEmpty && userName.isNotEmpty && department.isNotEmpty) {
      // Get the index of the selected department
      int departmentIndex = _getDepartmentIndex(department);

      // Log in with the provided details using the LoginProvider
      Provider.of<LoginProvider>(context, listen: false).logIn(
        hotelName: hotelName,
        userName: userName,
        department: department,
      );

      // Navigate to the appropriate dashboard based on the department
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              CustomBottomNavigationBar(departmentIndex: departmentIndex),
        ),
      );
    } else {
      // Show error if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all the fields')),
      );
    }
  }

  // Helper method to get the department index
  int _getDepartmentIndex(String department) {
    final Map<String, int> departmentMap = {
      'Bellboys': 0,
      'Laundry': 1,
      'Restaurant': 2,
      'Spa & Gym': 3,
      'Transportation + GPS': 4,
      'Maintenance': 5,
      'House Keeping': 6,
    };

    return departmentMap[department] ??
        0; // Default to the first department if no match
  }

  // Method to clear specific login details from SharedPreferences
  Future<void> _clearLoginDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Remove specific keys
    await prefs.remove('hotelName');
    await prefs.remove('userName');
    await prefs.remove('department');
    await prefs.remove('route');
    await prefs.remove('checkInTime');
    await prefs.remove('checkOutTime');
    await prefs.remove('date');
    await prefs.setBool(
        'isLoggedIn', false); // Ensure the user is not logged in

    print('Specific login details cleared');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white, // Set background to white
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.17), // Top spacer
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
                color: const Color.fromARGB(255, 178, 177, 177),
              ),
            ),
            SizedBox(height: height * 0.06), // Spacer
            // Input for hotel name
            AppTextField(
              controller: hotelNameController,
              hintText: "Hotel Name",
              height: height,
              width: width,
            ),
            SizedBox(height: height * 0.02), // Spacer
            // Input for user name
            AppTextField(
              controller: userNameController,
              hintText: "User Name",
              height: height,
              width: width,
            ),
            SizedBox(height: height * 0.02), // Spacer
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
                value: selectedDepartment,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDepartment = newValue;
                  });
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
                style: GoogleFonts.montserrat(
                  fontSize: 17,
                  color: Colors.black,
                ),
                dropdownColor: backgroundColor,
              ),
            ),
            SizedBox(height: height * 0.06), // Spacer
            // Sign in button
            AppTextButton(
              text: "Sign In",
              onPressed: () => _login(context),
              height: height,
              width: width,
            ),
            SizedBox(height: height * 0.04), // Spacer

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
            SizedBox(height: height * 0.10), // Bottom spacer
          ],
        ),
      ),
    );
  }
}
