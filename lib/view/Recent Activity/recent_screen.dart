import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuchtrip_staff_portal/utils/app_colors.dart';
import 'package:tuchtrip_staff_portal/utils/text_styles.dart';
import 'package:tuchtrip_staff_portal/view/Registration/login_screen.dart';

class RecentActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(
              top: height * 0.04,
              left: width * 0.02,
              right: width * 0.02,
              bottom: height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: blackShadeColor,
                ),
              ),
              Text(
                "Recent Activity",
                style: mediumTextstylebold,
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.02),
                child: Icon(
                  Icons.notifications_none_rounded,
                  color: blackShadeColor,
                ),
              )
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2 / 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: roomList.length,
          itemBuilder: (context, index) {
            return RoomCard(room: roomList[index]);
          },
        ),
      ]),
    );
  }
}

class RoomCard extends StatelessWidget {
  final Room room;

  RoomCard({required this.room});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              offset: Offset(-0.3, 1),
              blurRadius: 2,
              blurStyle: BlurStyle.normal,
              spreadRadius: 0,
              color: greyShadeLight),
        ],
      ),
      child: InkWell(
        onTap: () {
          // Navigate to room details or update page
        },
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            top: height * 0.02,
            right: width * 0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Room ${room.number}', style: mediumTextstylebold),
                  Text(
                    room.type,
                    style: smallTextStyle,
                  ),
                  sizedBox(height * 0.02, width * 0.01),
                  Text(
                    room.status,
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: getStatusColor(room.status),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "9:00 am to 9:15",
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  sizedBox(height * 0.01, width * 0.01),
                  GestureDetector(
                    onTap: () {
                      // Function to update room status
                    },
                    child: Container(
                        height: height * 0.05,
                        width: width * 0.30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 101, 212,
                                  246), // Converted from #f6d365 (starting color)
                              Color.fromARGB(255, 133, 247, 253),
                            ])),
                        child: Center(
                            child: Text(
                          'Update',
                          style: smallTextstylewhitebold,
                        ))),
                  ),
                ],
              ),
              Container(
                height: height * 0.19,
                width: width * 0.400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assests/images/Room1.jpg",
                        ),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(10)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'Cleaned':
        return Colors.green;
      case 'Occupied':
        return Colors.red;
      case 'Cleaning':
        return Colors.orange;
      case 'Scheduled':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}

class Room {
  final int number;
  final String type;
  final String status;

  Room({
    required this.number,
    required this.type,
    required this.status,
  });
}

// Dummy data for rooms
List<Room> roomList = [
  Room(
    number: 101,
    type: 'Single',
    status: 'Cleaned',
  ),
  Room(
    number: 102,
    type: 'Double',
    status: 'Cleaning',
  ),
  Room(number: 103, type: 'Suite', status: 'Scheduled'),
];
