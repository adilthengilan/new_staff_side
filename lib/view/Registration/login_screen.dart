// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuchtrip_staff_portal/utils/text_styles.dart';
import 'package:tuchtrip_staff_portal/view/Common%20Widget/app_textButton.dart';
import 'package:tuchtrip_staff_portal/view/Common%20Widget/app_textfield.dart';
import 'package:tuchtrip_staff_portal/view/Dashboard/dashboard.dart';
import 'package:tuchtrip_staff_portal/view/Registration/signUp_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController mobilenumbercontrollor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final loginProvider = Provider.of<LoginProvider>(context);

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
              'Sign in to countinue!',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 178, 177, 177),
              ),
            ),
            sizedBox(height * 0.06, width),
            //---------------------------------- Here are the Text Field -----------------------------------------
            AppTextField(
              controller: mobilenumbercontrollor,
              hintText: "Mobile Number",
              height: height,
              width: width,
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
            //------------------------------------ Text Button --------------------------------------------------------------------
            sizedBox(height * 0.06, width),

            AppTextButton(
              text: "Sign In",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
              height: height,
              width: width,
            ),
            sizedBox(height * 0.02, width),
            Row(
              children: [
                SizedBox(width: width * 0.2),
                Text(
                  'Already have an account?',
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
                    ' SignUp',
                    style: smallblueTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget sizedBox(height, width) {
  return SizedBox(
    height: height,
    width: width,
  );
}
