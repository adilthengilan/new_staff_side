import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuchtrip_staff_portal/utils/app_colors.dart';
import 'package:tuchtrip_staff_portal/utils/text_styles.dart';
import 'package:tuchtrip_staff_portal/view%20model/request_provider.dart';

class RoomStatus extends StatelessWidget {
  const RoomStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final requestProvider = Provider.of<RequestProvider>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: height * 0.06,
                  left: width * 0.02,
                  right: width * 0.02,
                  bottom: height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                  Text(
                    "Room Status",
                    style: mediumTextstylebold,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.02),
                    child: const Icon(
                      Icons.notifications_none_rounded,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10.0),
              itemCount: requestProvider.requests.length,
              itemBuilder: (context, index) {
                return RequestCard(
                    request: requestProvider.requests[index], index: index);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  final Request request;
  final int index;

  const RequestCard({super.key, required this.request, required this.index});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final requestProvider = Provider.of<RequestProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                offset: Offset(-0.3, 1),
                blurRadius: 2,
                blurStyle: BlurStyle.normal,
                spreadRadius: 0,
                color: Colors.grey),
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
                      Text('Room ${request.number}',
                          style: mediumTextstylebold),
                      Text(
                        request.type,
                        style: smallTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        request.date,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: blackShadeColor),
                      ),
                      Text(
                        request.time,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: blackShadeColor),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: height * 0.02),
              Text('Status: ${request.status}',
                  style: TextStyle(
                      color: getStatusColor(request.status),
                      fontSize: 12,
                      fontWeight: FontWeight.w700)),
              Text(
                'Needs: ${request.needs}',
                style: smallTextStylebold,
              ),
              SizedBox(height: height * 0.02),
              if (request.status == 'Pending')
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        requestProvider.updateStatus(index, 'Declined');
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.red),
                        child: const Center(
                          child: Text(
                            'Decline',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        requestProvider.updateStatus(index, 'Accepted');
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green),
                        child: const Center(
                          child: Text(
                            'Accept',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

Color getStatusColor(String status) {
  switch (status) {
    case 'Delivered':
      return Colors.green;
    case 'Declined':
      return Colors.red;
    case 'Pending':
      return Colors.orange;
    case 'Maintenance':
      return Colors.blue;
    default:
      return Colors.grey;
  }
}

class Request {
  final String needs;
  final String date;
  late final String status;
  final String time;
  final int number;
  final String type;

  Request({
    required this.needs,
    required this.date,
    required this.status,
    required this.time,
    required this.number,
    required this.type,
  });
}
