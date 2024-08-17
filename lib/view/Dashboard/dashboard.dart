import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuchtrip_staff_portal/utils/app_colors.dart';
import 'package:tuchtrip_staff_portal/utils/text_styles.dart';
import 'package:tuchtrip_staff_portal/view%20model/login_provider.dart';
import 'package:tuchtrip_staff_portal/view/Registration/login_screen.dart';
import 'package:tuchtrip_staff_portal/view/Registration/signUp_screen.dart';

class HousekeepingDashboard extends StatefulWidget {
  const HousekeepingDashboard({super.key});

  @override
  State<HousekeepingDashboard> createState() => _HousekeepingDashboardState();
}

class _HousekeepingDashboardState extends State<HousekeepingDashboard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool hasNewRequest = false;

    // Get the login provider
    final loginProvider = Provider.of<LoginProvider>(context);

    // Function to show room service request dialog
    void showRoomServiceRequest(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[200],
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "A Room Service Request",
                  style: smallTextStylebold,
                ),
                Text(
                  "Room 101",
                  style: mediumTextstylebold,
                ),
                Text("10:00 AM", style: smallgreyTextStyle),
              ],
            ),
            content: Text(
              "- Wants additional pillows\n- A set of fresh towels",
              style: smallTextStyle,
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        hasNewRequest = false;
                      });
                      Navigator.pop(context);
                      // Function to handle decline action
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                      ),
                      child: const Center(
                        child: Text(
                          'Decline',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        hasNewRequest = false;
                      });
                      Navigator.pop(context);
                      // Function to handle accept action
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green,
                      ),
                      child: const Center(
                        child: Text(
                          'Accept',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: primarycolor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            child: Padding(
              padding:
                  EdgeInsets.only(left: width * 0.04, bottom: height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.02, width),
                  Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.02,
                        left: width * 0.02,
                        right: width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              hasNewRequest = true;
                            });

                            if (hasNewRequest) {
                              showRoomServiceRequest(context);
                            }
                          },
                          child: const Icon(
                            Icons.notifications_none_rounded,
                            color: backgroundColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  // Header section with profile picture and greeting
                  Container(
                    height: height * 0.11,
                    width: width * 0.22,
                    decoration: const BoxDecoration(
                      color: transparantColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/Profile_person_Icon.png",
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.125, top: 50),
                      child: MaterialButton(
                        onPressed: () {
                          // Profile image picker function
                        },
                        color: Colors.blue,
                        child: Center(
                          child: Icon(
                            Icons.photo_camera,
                            color: backgroundColor,
                            size: 14,
                          ),
                        ),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(2),
                      ),
                    ),
                  ),
                  sizedBox(height * 0.01, width),
                  Text(
                    "Good Morning",
                    style: mediumTextstylewhitebold,
                  ),
                  Text(
                    "Hi ${loginProvider.userName}", // Use username from provider
                    style: mediumTextstylewhitebold,
                  ),
                  Text(
                    "${loginProvider.department}", // Use department from provider
                    style: smallTextstylewhitebold,
                  ),
                  sizedBox(height * 0.03, width),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    child: Container(
                      height: height * 0.10,
                      width: width * 0.850,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(07),
                          color: backgroundColor),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.02,
                            right: width * 0.02,
                            top: height * 0.02,
                            bottom: height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Thursday",
                                  style: smallTextStylebold,
                                ),
                                Text(
                                  // loginProvider.date ??
                                  '2/08/2023',
                                  style: smallTextStyle,
                                ),
                              ],
                            ),
                            const VerticalDivider(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Check in",
                                  style: smallTextStylebold,
                                ),
                                Text(
                                  // loginProvider.checkInTime ??
                                  '10:00 am',
                                  style: smallTextStyle,
                                ),
                              ],
                            ),
                            const VerticalDivider(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Check Out",
                                  style: smallTextStylebold,
                                ),
                                Text(
                                  // loginProvider.checkOutTime ??
                                  '5:00pm',
                                  style: smallTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          sizedBox(height * 0.03, width),
          Padding(
            padding: EdgeInsets.only(left: width * 0.04, right: width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recent Requests",
                  style: mediumTextstylebold,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    // Reverse the recent requests list
                    final reversedRequests = recentRequests.reversed.toList();
                    final request = reversedRequests[index];

                    return Padding(
                      padding: EdgeInsets.only(top: height * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 46,
                                width: 58,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: backgroundColor,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(-0.3, 1),
                                        blurRadius: 2,
                                        blurStyle: BlurStyle.normal,
                                        spreadRadius: 0,
                                        color: greyShadeLight),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.alarm,
                                  color: Colors.green,
                                ),
                              ),
                              sizedBox(height * 0.01, width * 0.02),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Room ${request.room}",
                                    style: smallTextStylebold,
                                  ),
                                  Text(
                                    "${request.time}",
                                    style: smallTextStyle,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  // Function to update room status
                                },
                                child: Container(
                                    height: height * 0.05,
                                    width: width * 0.18,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.red),
                                    child: Center(
                                        child: Text(
                                      'Decline',
                                      style: smallTextstylewhitebold,
                                    ))),
                              ),
                              sizedBox(height * 0.01, width * 0.03),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);

                                  // Function to update room status
                                },
                                child: Container(
                                    height: height * 0.05,
                                    width: width * 0.18,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.green),
                                    child: Center(
                                        child: Text(
                                      'Accept',
                                      style: smallTextstylewhitebold,
                                    ))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                sizedBox(height * 0.04, width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: const AssetImage("assests/images/7653930.png"),
                      height: height * 0.09,
                      width: width * 0.09,
                    ),
                    sizedBox(height * 0.01, width * 0.02),
                    Text(
                      "Announcements",
                      style: mediumTextstylebold,
                    ),
                    sizedBox(height * 0.01, width * 0.2),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: announcements.length,
                  itemBuilder: (context, index) {
                    final announcement = announcements[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(-0.3, 1),
                                blurRadius: 2,
                                blurStyle: BlurStyle.normal,
                                spreadRadius: 0,
                                color: greyShadeLight),
                          ],
                          color: backgroundColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.01,
                            bottom: height * 0.02,
                            left: width * 0.02,
                            right: width * 0.02,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * 0.650,
                                    child: Text(
                                      announcement.title,
                                      style: smallTextStylebold,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Jan 02 2023",
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                255, 134, 132, 132),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "10:30 AM",
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                255, 134, 132, 132),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                width: width * 0.650,
                                child: Text(
                                  announcement.content,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          sizedBox(height * 0.03, width),
        ],
      ),
    );
  }
}

// Recent request model
class RecentRequest {
  final String room;
  final String time;

  RecentRequest({required this.room, required this.time});
}

List<RecentRequest> recentRequests = [
  RecentRequest(room: '205', time: '10:25 AM'),
  RecentRequest(room: '104', time: '9:45 AM'),
  RecentRequest(room: '302', time: '8:30 AM'),
  RecentRequest(room: '101', time: '7:15 AM'),
];

// Announcement model
class Announcement {
  final String title;
  final String content;

  Announcement({required this.title, required this.content});
}

List<Announcement> announcements = [
  Announcement(
      title: 'Employee of the Month: July',
      content:
          'Congratulations to Jane Doe for being awarded Employee of the Month! Jane\'s outstanding service in the restaurant department has been exemplary'),
  Announcement(
      title: 'Annual Staff Appreciation Event',
      content:
          'Join us for the annual staff appreciation event on August 15th at 6 PM in the banquet hall. It\'s a night to celebrate our team\'s hard work and dedication!'),
  Announcement(
      title: 'Updated Uniform Policy',
      content:
          'Please note the updated uniform policy effective from August 1st. All staff are required to wear the new uniforms provided. For more details, refer to the policy document shared via email.'),
  Announcement(
      title: 'Positive Guest Feedback',
      content:
          'We received wonderful feedback from a guest who stayed in room 302. A special mention to the bellboys and housekeeping team for their exceptional service!'),
];
