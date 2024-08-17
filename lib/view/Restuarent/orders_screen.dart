import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuchtrip_staff_portal/utils/app_colors.dart';
import 'package:tuchtrip_staff_portal/utils/text_styles.dart';
import 'package:tuchtrip_staff_portal/view/Registration/login_screen.dart';
import 'package:tuchtrip_staff_portal/view/Service%20Requests/service_requests.dart';
import 'package:tuchtrip_staff_portal/view/Registration/signUp_screen.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(
              top: height * 0.06,
              left: width * 0.02,
              right: width * 0.02,
              bottom: height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back_ios_new,
                color: blackShadeColor,
              ),
              Text(
                "Orders",
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
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(10.0),
          itemCount: requestList.length,
          itemBuilder: (context, index) {
            return RequestCard(request: requestList[index]);
          },
        ),
      ]),
    );
  }
}

class RequestCard extends StatelessWidget {
  final Request request;

  RequestCard({required this.request});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                offset: Offset(-0.3, 1),
                blurRadius: 2,
                blurStyle: BlurStyle.normal,
                spreadRadius: 0,
                color: greyShadeLight),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Table ${request.number}',
                          style: mediumTextstylebold),
                      // Text(
                      //   request.type,
                      //   style: smallTextStyle,
                      // ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        request.date,
                        style: smallTextStylebold,
                      ),
                      Text(
                        request.time,
                        style: smallTextStylebold,
                      ),
                    ],
                  )
                ],
              ),
              sizedBox(height * 0.02, width * 0.01),
              Text('Status: ${request.status}',
                  style: GoogleFonts.montserrat(
                      color: getStatusColor(request.status),
                      fontSize: 12,
                      fontWeight: FontWeight.w700)),
              Text(
                'Orders: ${request.needs}',
                style: smallTextStylebold,
              ),
              sizedBox(height * 0.01, width),
              Text(
                "9:00 - 9:30",
                style: smallTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Color getStatusColor(String status) {
  switch (status) {
    case 'Ready To Serve':
      return Colors.green;
    case 'Delivered':
      return Colors.red;
    case 'Pending':
      return Colors.orange;
    case 'Being Cooked':
      return Colors.blue;
    default:
      return Colors.grey;
  }
}

// Dummy data for requests
List<Request> requestList = [
  Request(
      needs: 'Cappucino, Breakfast for two',
      date: '2024-07-31',
      time: '08:30 AM',
      number: 102,
      type: 'Single',
      status: 'Ready To Serve'),
  Request(
      needs: 'Dinner reservation, Wine',
      date: '2024-07-31',
      time: '07:00 PM',
      number: 205,
      type: 'Double',
      status: 'Pending'),
  Request(
      needs: 'Vegan meal, Extra cutlery',
      date: '2024-08-01',
      time: '12:00 PM',
      number: 101,
      type: 'Single',
      status: 'Being Cooked'),
  Request(
      needs: 'Iced Cofee',
      date: '2024-08-01',
      time: '03:00 PM',
      number: 111,
      type: 'Single',
      status: 'Delivered'),
];
