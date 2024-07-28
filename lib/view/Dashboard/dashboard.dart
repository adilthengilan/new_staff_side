import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuchtrip_staff_portal/utils/app_colors.dart';
import 'package:tuchtrip_staff_portal/utils/text_styles.dart';
import 'package:tuchtrip_staff_portal/view/Bottom%20Navigation%20Bar/bottom_navigation_bar.dart';
import 'package:tuchtrip_staff_portal/view/Recent%20Activity/recent_screen.dart';
import 'package:tuchtrip_staff_portal/view/Registration/login_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 5, 106, 122),
        leading: Icon(
          Icons.line_style,
          color: backgroundColor,
        ),
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: backgroundColor,
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
                        Text(
                          "10:00am",
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 158, 157, 157),
                          ),
                        ),
                      ],
                    ),
                    content: Text(
                      "-Wants a Additional pillows\n-A set of fresh towels",
                      // style: smallTextStyle,
                    ),
                    actions: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              // Function to update room status
                            },
                            child: Container(
                                height: height * 0.05,
                                width: width * 0.30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(colors: [
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
                                width: width * 0.30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(colors: [
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
                  );
                },
              );
            },
            child: Icon(
              Icons.notifications_none_rounded,
              color: backgroundColor,
            ),
          )
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.30,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 5, 106, 122),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBox(height * 0.02, width),

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
                    sizedBox(height * 0.05, width),
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
                              VerticalDivider(),
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
                              VerticalDivider(),
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
                        "Recent Activity",
                        style: mediumTextstylebold,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RecentActivity()));
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
                    itemCount: 3,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(top: height * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 241, 227, 184),
                                child: Icon(Icons.login),
                              ),
                              sizedBox(height * 0.01, width * 0.02),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Check In",
                                    style: smallTextStylebold,
                                  ),
                                  Text(
                                    "27 may 2025",
                                    style: smallTextStyle,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "7:30 am",
                                style: smallTextStylebold,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            sizedBox(height * 0.03, width),
            Padding(
              padding: EdgeInsets.only(
                  top: height * 0.01, left: width * 0.04, right: width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Get Connect",
                        style: mediumTextstylebold,
                      ),
                      Container(
                        height: height * 0.03,
                        width: width * 0.30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 247, 246, 246),
                        ),
                        child: Center(
                          child: Text(
                            "25 may 2025",
                          ),
                        ),
                      )
                    ],
                  ),
                  sizedBox(height * 0.03, width),
                  serviceList(height, width),
                  sizedBox(height * 0.09, width),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  //========================================  Service List ========================================
  Widget serviceList(height, width) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 2.1 / 2,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          String image = '';
          String text = '';
          Color color = Colors.transparent;
          VoidCallback onPressed = () {};
          switch (index) {
            case 0:
              image = 'assests/images/reserve-removebg-preview.png';
              text = 'Restuarant ';
              color = Color.fromARGB(255, 155, 237, 255);
            case 1:
              image = 'assests/images/spa-towel-6895931-5655950.webp';
              text = 'Room Services';
              color = Color.fromARGB(255, 177, 163, 255);
            case 2:
              image = 'assests/images/images__1_-removebg-preview.png';
              text = 'Luandry service';
              color = Color.fromARGB(255, 241, 164, 255);
            case 3:
              image = 'assests/images/images__1_-removebg-preview.png';
              text = 'Parking';
              color = const Color.fromARGB(255, 255, 171, 171);
            case 4:
              image = 'assests/images/images__1_-removebg-preview.png';
              text = 'Bell boys';
              color = Color.fromARGB(237, 175, 255, 239);
            case 5:
              image = 'assests/images/images__1_-removebg-preview.png';
              text = 'Other Amenities';
              color = const Color.fromARGB(255, 255, 142, 179);
            default:
          }
          return Container(
            height: height * 0.100,
            width: width * 0.20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                    offset: Offset(-0.3, 1),
                    blurRadius: 2,
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 0,
                    color: greyShadeDark
                    // color: darktheme
                    //     ? Color.fromARGB(255, 165, 223, 254)
                    //     : Color.fromARGB(255, 248, 248, 248),
                    ),
              ],
              color: color,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.10,
                  width: width * 0.20,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.fill)),
                ),
                Text(
                  text,
                  style: smallTextStylebold,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        });
  }
}
