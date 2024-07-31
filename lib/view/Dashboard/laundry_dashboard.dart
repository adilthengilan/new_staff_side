import 'package:flutter/material.dart';
import 'package:tuchtrip_staff_portal/utils/app_colors.dart';
import 'package:tuchtrip_staff_portal/utils/text_styles.dart';
import 'package:tuchtrip_staff_portal/view/Registration/login_screen.dart';

class LaundryDashboard extends StatefulWidget {
  const LaundryDashboard({super.key});

  @override
  State<LaundryDashboard> createState() => _LaundryDashboardState();
}

class _LaundryDashboardState extends State<LaundryDashboard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool hasNewRequest = false;
    
    //============================================================================================
    //====================================== Room service request ================================
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
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 246, 101, 101),
                            Color.fromARGB(255, 253, 161, 133),
                          ],
                        ),
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
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 171, 246, 101),
                            Color.fromARGB(255, 133, 253, 147),
                          ],
                        ),
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
//============================================================================================
//====================================== Room service request ================================
//============================================================================================

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 5, 106, 122),
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

                  sizedBox(height * 0.01, width),

                  Text(
                    "Good Morning",
                    style: mediumTextstylewhitebold,
                  ),
                  Text(
                    "Hi Alex Abraham",
                    style: mediumTextstylewhitebold,
                  ),
                  // Text(
                  //   "Reception Manager",
                  //   style: smallTextstylewhite,
                  // ),
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
                                  "Thursady",
                                  style: smallTextStylebold,
                                ),
                                Text(
                                  "25 May 2025",
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
                                  "8:00 Am",
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
                                  "5:00 Pm",
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
          //---------------------------------------------------------------------------------------------------------------------------------------
          //---------------------------------------------------------------------------------------------------------------------------------------
          sizedBox(height * 0.03, width),

          Padding(
            padding: EdgeInsets.only(left: width * 0.04, right: width * 0.03),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Requests",
                      style: mediumTextstylebold,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => RecentActivity()));
                        },
                        child: Text(
                          "See more",
                          style: smallblueTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
                ListView.builder(
                  //----------------------------------------------------------Listview Builder ----------------------------------------
                  shrinkWrap: true,
                  itemCount: 4,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(top: height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 109, 191, 204),
                              child: Icon(
                                Icons.local_laundry_service_sharp,
                                color: backgroundColor,
                              ),
                            ),
                            sizedBox(height * 0.01, width * 0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Room 205",
                                  style: smallTextStylebold,
                                ),
                                Text(
                                  "10:25am",
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
                                      gradient: const LinearGradient(colors: [
                                        Color.fromARGB(255, 246, 101,
                                            101), // Converted from #f6d365 (starting color)
                                        Color.fromARGB(255, 253, 161, 133),
                                      ])),
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
                                      gradient: const LinearGradient(colors: [
                                        Color.fromARGB(255, 171, 246,
                                            101), // Converted from #f6d365 (starting color)
                                        Color.fromARGB(255, 133, 253, 147),
                                      ])),
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
                  ),
                ),
                sizedBox(height * 0.04, width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Announcements",
                      style: mediumTextstylebold,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => RecentActivity()));
                        },
                        child: Text(
                          "See more",
                          style: smallblueTextStyle,
                        ),
                      ),
                    )
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
                              top: height * 0.01, bottom: height * 0.02),
                          child: ListTile(
                            title: Text(
                              announcement.title,
                              style: smallTextStylebold,
                            ),
                            subtitle: Text(
                              announcement.content,
                              style: smallTextStyle,
                            ),
                            trailing: const CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 100, 205, 132),
                              child: Icon(
                                Icons.speaker_notes_outlined,
                                color: backgroundColor,
                              ),
                            ),
                            onTap: () {},
                            // onTap: () => Navigator.push(
                            //   context,
                            //   // MaterialPageRoute(
                            //   //   builder: (context) => AnnouncementDetail(announcement: announcement),
                            //   // ),
                            // ),
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
          // Padding(
          //   padding: EdgeInsets.only(
          //       top: height * 0.01, left: width * 0.04, right: width * 0.03),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             "Get Connect",
          //             style: mediumTextstylebold,
          //           ),
          //           Container(
          //             height: height * 0.03,
          //             width: width * 0.30,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: Color.fromARGB(255, 247, 246, 246),
          //             ),
          //             child: Center(
          //               child: Text(
          //                 "25 may 2025",
          //               ),
          //             ),
          //           )
          //         ],
          //       ),
          //       // sizedBox(height * 0.02, width),
          //       // serviceList(height, width),
          //       sizedBox(height * 0.09, width),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

//========================================== Announcemenyt=====================================
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
