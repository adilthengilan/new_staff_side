import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuchtrip_staff_portal/model/staff_model.dart';
import 'package:tuchtrip_staff_portal/utils/app_colors.dart';
import 'package:tuchtrip_staff_portal/utils/text_styles.dart';
import 'package:tuchtrip_staff_portal/view%20model/login_provider.dart';
import 'package:tuchtrip_staff_portal/view/Bottom%20Navigation%20Bar/bottom_navigation_bar.dart';
import 'package:tuchtrip_staff_portal/view/Common%20Widget/app_textButton.dart';
import 'package:tuchtrip_staff_portal/view/Common%20Widget/app_textfield.dart';
import 'package:tuchtrip_staff_portal/view/Registration/signUp_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController hotelNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

  final List<String> departments = ['Bellboys', 'Laundry', 'Restaurant'];

  void _login(BuildContext context) {
    String hotelName = hotelNameController.text.trim();
    String userName = userNameController.text.trim();
    String department = departmentController.text.trim();

    if (hotelName.isNotEmpty && userName.isNotEmpty && department.isNotEmpty) {
      int departmentIndex = _getDepartmentIndex(department);

      Provider.of<LoginProvider>(context, listen: false)
          .logIn(hotelName, userName, department);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              CustomBottomNavigationBar(departmentIndex: departmentIndex),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the fields')),
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
            sizedBox(height * 0.3, width),
            Text(
              'Welcome Back!',
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Text(
              'Sign in to continue!',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 178, 177, 177),
              ),
            ),
            sizedBox(height * 0.06, width),
            AppTextField(
              controller: hotelNameController,
              hintText: "Hotel Name",
              height: height,
              width: width,
            ),
            sizedBox(height * 0.02, width),
            AppTextField(
              controller: userNameController,
              hintText: "User Name",
              height: height,
              width: width,
            ),
            sizedBox(height * 0.02, width),
            Padding(
              padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'Select Department',
                  hintStyle: GoogleFonts.montserrat(
                      fontSize: 17,
                      color: greyShadeLight,
                      fontWeight: FontWeight.w600),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
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
            sizedBox(height * 0.02, width),
            Padding(
              padding: EdgeInsets.only(left: width * 0.16),
              child: Row(
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
            ),
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
