import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuchtrip_staff_portal/utils/text_styles.dart';
import 'package:tuchtrip_staff_portal/view/Bottom%20Navigation%20Bar/bottom_navigation_bar.dart';
import 'package:tuchtrip_staff_portal/view/Common%20Widget/app_textButton.dart';
import 'package:tuchtrip_staff_portal/view/Common%20Widget/app_textfield.dart';
import 'package:tuchtrip_staff_portal/view/Dashboard/bellboys_dashboard.dart';
import 'package:tuchtrip_staff_portal/view/Registration/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //-----------------------SignUp Page Text Field Controllers-------------------------------
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController hotelnameController = TextEditingController();

    //---------------------Media Query is for assign with responsive size--------------
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final formState = Provider.of<FormStateNotifier>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBox(height * 0.135, width),
            Text(
              'Create Account',
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Text(
              'Create a new account to countinue!',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 178, 177, 177),
              ),
            ),
            sizedBox(height * 0.09, width),

            //---------------------------------- Here are the Text Field -----------------------------------------
            AppTextField(
              controller: firstNameController,
              hintText: "First Name",
              height: height,
              width: width,
            ),
            sizedBox(height * 0.02, 0.0),
            AppTextField(
              controller: lastNameController,
              hintText: "Last Name",
              height: height,
              width: width,
            ),
            sizedBox(height * 0.02, 0.0),
            AppTextField(
              controller: emailController,
              hintText: "Email",
              height: height,
              width: width,
            ),
            sizedBox(height * 0.02, 0.0),
            AppTextField(
              controller: hotelnameController,
              hintText: "Hotel Name",
              height: height,
              width: width,
            ),
            //------------------------------------------------------------------------------------------------------------
            //----------------------------------------- DEPARTMENT -------------------------------------------------------------------

            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.05, top: height * 0.04, right: width * 0.03),
              child: Form(
                key: formState.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Department/Area of Work*',
                      style: smallTextStylebold,
                    ),
                    Column(
                      children: [
                        RadioListTile<String>(
                          title: Text(
                            'F&B',
                            style: smallTextStyle,
                          ),
                          value: 'F&B',
                          groupValue: formState.selectedDepartment,
                          onChanged: (value) {
                            formState.selectedDepartment = value!;
                          },
                        ),
                        RadioListTile<String>(
                          title:
                              Text('Spa and Wellness', style: smallTextStyle),
                          value: 'Spa and Wellness',
                          groupValue: formState.selectedDepartment,
                          onChanged: (value) {
                            formState.selectedDepartment = value!;
                          },
                        ),
                        RadioListTile<String>(
                          title: Text('Front Desk', style: smallTextStyle),
                          value: 'Front Desk',
                          groupValue: formState.selectedDepartment,
                          onChanged: (value) {
                            formState.selectedDepartment = value!;
                          },
                        ),
                        RadioListTile<String>(
                          title: Text('Quality', style: smallTextStyle),
                          value: 'Quality',
                          groupValue: formState.selectedDepartment,
                          onChanged: (value) {
                            formState.selectedDepartment = value!;
                          },
                        ),
                        RadioListTile<String>(
                          title: Text('Corporate team', style: smallTextStyle),
                          value: 'Corporate team',
                          groupValue: formState.selectedDepartment,
                          onChanged: (value) {
                            formState.selectedDepartment = value!;
                          },
                        ),
                        RadioListTile<String>(
                          title: Text('Other', style: smallTextStyle),
                          value: 'Other',
                          groupValue: formState.selectedDepartment,
                          onChanged: (value) {
                            formState.selectedDepartment = value!;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Text('Preferred language*', style: smallTextStylebold),
                    sizedBox(height * 0.01, width),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)),
                      ),
                      hint: Text('Please Select'),
                      value: formState.selectedLanguage,
                      items: [
                        'English',
                        'Spanish',
                        'French',
                        'German',
                        'Chinese'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        formState.selectedLanguage = value!;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please complete this required field.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    if (formState.hasError)
                      Text(
                        'Please complete this required field.',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
            ),

            //---------------------------------- Use Email Button ---------------------------------------------------------------------
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

            sizedBox(height * 0.065, 0.0),
            //------------------------------------ Text Button --------------------------------------------------------------------
            AppTextButton(
              text: "Sign Up",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomBottomNavigationBar(departmentIndex: 2,)));
              },
              height: height,
              width: width,
            ),
            sizedBox(height * 0.02, width),
            Padding(
              padding: EdgeInsets.only(left: width * 0.16),
              child: Row(
                children: [
                  Text(
                    'Already have an account?',
                    style: smallTextStyle,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      ' Login',
                      style: smallblueTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            sizedBox(height * 0.10, width),
          ],
        ),
      ),
    );
  }
}

class FormStateNotifier extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _selectedDepartment;
  String? _selectedLanguage;
  bool _hasError = false;

  String? get selectedDepartment => _selectedDepartment;
  set selectedDepartment(String? value) {
    _selectedDepartment = value;
    _hasError = false;
    notifyListeners();
  }

  String? get selectedLanguage => _selectedLanguage;
  set selectedLanguage(String? value) {
    _selectedLanguage = value;
    _hasError = false;
    notifyListeners();
  }

  bool get hasError => _hasError;

  void showError() {
    _hasError = true;
    notifyListeners();
  }
}
