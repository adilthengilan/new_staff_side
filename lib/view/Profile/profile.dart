import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuchtrip_staff_portal/utils/app_colors.dart';
import 'package:tuchtrip_staff_portal/utils/text_styles.dart';
import 'package:tuchtrip_staff_portal/view%20model/login_provider.dart';
import 'package:tuchtrip_staff_portal/view/Registration/login_screen.dart';
import 'package:tuchtrip_staff_portal/view/Registration/signUp_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final loginProvider = Provider.of<LoginProvider>(context);
    final checkInTime = loginProvider.checkInTime;
    final checkOutTime = loginProvider.checkOutTime;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        Container(
          width: width,
          padding: EdgeInsets.only(
            top: height * 0.12,
            bottom: height * 0.06,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(4, 4),
                blurRadius: 4,
                color: Color.fromARGB(255, 228, 228, 228),
              ),
              BoxShadow(
                offset: Offset(-3, 0),
                blurRadius: 4,
                color: Color.fromARGB(255, 216, 216, 216),
              ),
            ],
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 163, 238, 255),
              Color.fromARGB(255, 252, 215, 249),
            ]),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
            // image: darktheme
            //     ? DecorationImage(
            //         image: AssetImage("assets/images/Profile_Bg_Image.png"),
            //         fit: BoxFit.fill,
            //       )
            //     : DecorationImage(
            //         image: AssetImage(
            //             "assets/images/profile_background_lightTheme.png"),
            //         fit: BoxFit.cover,
            //       ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.046),
            child: Column(
              children: [
                Container(
                  height: height * 0.11,
                  width: width * 0.22,
                  decoration: const BoxDecoration(
                    color: transparantColor,
                    shape: BoxShape.circle,
                    image:
                        //  profileProvider.image != null
                        //     ? DecorationImage(
                        //         fit: BoxFit.cover,
                        //         image: FileImage(profileProvider.image!),
                        //       )
                        // :
                        DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/Profile_person_Icon.png",
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.125, top: 50),
                    //================================================================ Image Picker Button ==================================================
                    child: MaterialButton(
                      onPressed: () {
                        // =========================================================== Image Picker From Device Gallery [Function] ===========================
                        // profileProvider.openImagePicker();
                      },
                      color: Colors.blue,
                      child: Center(
                        child: Icon(
                          Icons.photo_camera,
                          color: backgroundColor,
                          size: 14,
                        ),
                        //  AppIcon(
                        //   iconData: Icons.photo_camera,
                        //   color: Colors.white,
                        //   height: height * 0.02,
                        // ),
                      ),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(2),
                    ),
                  ),
                ),
                sizedBox(height * 0.03, 0.0),
                //===================================================================== User Name ===========================================
                Text(loginProvider.userName!, style: mediumTextstylebold),
                Text("(Employee id)", style: smallTextStyle),
                sizedBox(height * 0.061, 0.0),

                Container(
                  width: width * 0.800,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(4, 4),
                        blurRadius: 4,
                        color: Color.fromARGB(45, 158, 158, 158),
                      ),
                      BoxShadow(
                        offset: Offset(-2, 0),
                        blurRadius: 4,
                        color: Color.fromARGB(255, 216, 216, 216),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.03, bottom: height * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Position",
                              style: smallgreyTextStyle,
                            ),
                            Text(
                              "Department",
                              style: smallgreyTextStyle,
                            ),
                            Text(
                              'Checkin and\n checkout',
                              style: smallgreyTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Chef",
                              style: smallTextStylebold,
                            ),
                            // sizedBox(height * 0.01, width * 0.01),
                            Text(
                              loginProvider.department!,
                              style: smallTextStyle,
                            ),
                            // sizedBox(height * 0.01, width * 0.01),
                            Text(
                              "10:00 am -\n 5:00 pm",
                              // '$checkInTime - $checkOutTime',
                              style: smallTextStyle,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        sizedBox(height * 0.04, 0.0),
        Container(
          width: width * 0.900,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 1),
                blurRadius: 2,
                color: Color.fromARGB(222, 228, 228, 228),
              ),
              BoxShadow(
                offset: Offset(-2, 0),
                blurRadius: 2,
                color: Color.fromARGB(255, 216, 216, 216),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: width * 0.03,
                top: height * 0.02,
                bottom: height * 0.02,
                right: width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Contact Info",
                      style: mediumTextstylebold,
                    ),
                    Text(
                      "Edit",
                      style: smallblueTextStyle,
                    )
                  ],
                ),
                sizedBox(height * 0.02, width * 0.01),
                Row(
                  children: [
                    const Icon(
                      Icons.phone_android_outlined,
                      color: greyShadeLight,
                      size: 18,
                    ),
                    sizedBox(height * 0.01, width * 0.01),
                    Text(
                      "9034567824",
                      style: smallTextStyle,
                    ),
                  ],
                ),
                sizedBox(height * 0.01, 0.0),
                Row(
                  children: [
                    const Icon(
                      Icons.mail_outline,
                      color: greyShadeLight,
                      size: 18,
                    ),
                    sizedBox(height * 0.01, width * 0.01),
                    Text(
                      "Infoalexabraham@gmail.com",
                      style: smallTextStyle,
                    )
                  ],
                ),
                sizedBox(height * 0.02, width),
              ],
            ),
          ),
        ),
        sizedBox(height * 0.03, width),
        _buildProfileButtonsGridType(height, width),
        sizedBox(height * 0.05, width),
      ]),
    );
  }

  // The Profile Buttons Listing in the ListView Builder, it Has 7 buttons, and its Title, Icon, and Icon color it is in a Map List Button Components
  Widget _buildProfileButtonsGridType(height, width) {
    return GridView.builder(
        itemCount: 4,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 20,
            childAspectRatio: 2 / 0.90),
        itemBuilder: (context, index) {
          IconData iconData = Icons.circle;
          String text = "";
          Color iconColor = Colors.transparent;
          VoidCallback onPressed = () {};
          switch (index) {
            // case 0:
            //   iconData = Icons.edit_outlined;
            //   text = "Profile";
            //   iconColor = Colors.yellow;
            //   onPressed = () {
            //     setState(() {
            //       darktheme = !darktheme;
            //     });
            //   };
            // case 1:
            //   iconData = Icons.settings_outlined;
            //   text = "Account";
            //   iconColor = Colors.blueAccent;
            //   onPressed = () {};
            case 0:
              iconData = Icons.history;
              text = "View Schedule";
              iconColor = Colors.pinkAccent;
              onPressed = () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => FavoriteScreen(),
                //   ),
                // );
              };
            case 1:
              iconData = Icons.notifications_active_outlined;
              text = "announcement";
              iconColor = Colors.green;
              onPressed = () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => BookingHistory()));
              };
            case 2:
              iconData = Icons.stacked_bar_chart_outlined;
              text = "Perfomance Report";
              iconColor = Colors.purple;
              onPressed = () {};
            case 3:
              iconData = Icons.logout;
              text = "Logout";
              iconColor = Colors.blue;
              onPressed = () {};

            default:
          }
          return InkWell(
            onTap: onPressed,
            child: Container(
              // height: height * 0.025,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(2, 1),
                    blurRadius: 2,
                    color: Color.fromARGB(222, 228, 228, 228),
                  ),
                  BoxShadow(
                    offset: Offset(-2, 0),
                    blurRadius: 2,
                    color: Color.fromARGB(255, 216, 216, 216),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  sizedBox(height * 0.02, width),
                  Icon(
                    //============================== Icon Data ==========================
                    iconData,
                    //============================== Icon Color ==========================
                    color: iconColor,
                    // height: height * 0.06,
                  ),
                  sizedBox(height * 0.01, width),
                  Text(
                    //================================= Text ==============================
                    text, textAlign: TextAlign.center, style: smallTextStyle,
                    // style: darktheme ? whiteSmallTextStyle : smallTextStyle,
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class FunctionalButtonsSection extends StatelessWidget {
  const FunctionalButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.schedule),
          title: Text('View Schedule', style: smallTextStyle),
          onTap: () {
            // Navigate to Schedule Screen
          },
        ),
        ListTile(
          leading: const Icon(Icons.time_to_leave),
          title: Text('Request Time Off', style: smallTextStyle),
          onTap: () {
            // Navigate to Time Off Request Screen
          },
        ),
        ListTile(
          leading: const Icon(Icons.feedback),
          title: Text('Submit Feedback', style: smallTextStyle),
          onTap: () {
            // Navigate to Feedback Screen
          },
        ),
        ListTile(
          leading: const Icon(Icons.attach_money),
          title: Text(
            'View Pay Slips',
            style: smallTextStyle,
          ),
          onTap: () {
            // Navigate to Pay Slips Screen
          },
        ),
        ListTile(
          leading: const Icon(Icons.school),
          title: Text('Training Modules', style: smallTextStyle),
          onTap: () {
            // Navigate to Training Modules Screen
          },
        ),
        ListTile(
          leading: const Icon(Icons.assessment),
          title: Text('Performance Reports', style: smallTextStyle),
          onTap: () {
            // Navigate to Performance Reports Screen
          },
        ),
        ListTile(
          leading: const Icon(Icons.message),
          title: Text('Communications', style: smallTextStyle),
          onTap: () {
            // Navigate to Communications Screen
          },
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: Text('Notifications and Announcements', style: smallTextStyle),
          onTap: () {
            // Navigate to Notifications Screen
          },
        ),
        ListTile(
          leading: const Icon(Icons.task),
          title: Text('Task Management', style: smallTextStyle),
          onTap: () {
            // Navigate to Task Management Screen
          },
        ),
        ListTile(
          leading: const Icon(Icons.contact_phone),
          title: Text('Emergency Contact', style: smallTextStyle),
          onTap: () {
            // Navigate to Emergency Contact Screen
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: Text('Logout', style: smallTextStyle),
          onTap: () {
            // Logout Logic
          },
        ),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class JobDescriptionCard extends StatelessWidget {
  const JobDescriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'As a Reception Manager, you are responsible for overseeing the front desk operations, ensuring guest satisfaction, managing the reception team, and handling guest inquiries and complaints. You will also coordinate with other departments to streamline operations and provide exceptional service.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class AssignedTasksList extends StatelessWidget {
  final List<String> tasks = [
    'Oversee check-in and check-out procedures',
    'Manage reception staff schedules',
    'Handle guest complaints and feedback',
    'Coordinate with housekeeping for room assignments',
    'Ensure lobby area is presentable',
  ];

  AssignedTasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.task),
            title: Text(tasks[index]),
          );
        },
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upcoming Shifts:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('July 27, 2024 - Morning Shift (8:00 AM - 4:00 PM)'),
            Text('July 28, 2024 - Night Shift (4:00 PM - 12:00 AM)'),
            Text('July 29, 2024 - Day Off'),
          ],
        ),
      ),
    );
  }
}

class SpecialProjectsList extends StatelessWidget {
  final List<String> projects = [
    'Implementing a new check-in system',
    'Staff training program for customer service',
    'Redesigning the lobby area',
  ];

  SpecialProjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.work),
            title: Text(projects[index]),
          );
        },
      ),
    );
  }
}
