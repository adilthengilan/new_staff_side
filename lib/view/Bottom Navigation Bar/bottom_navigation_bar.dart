import 'package:flutter/material.dart';
import 'package:tuchtrip_staff_portal/utils/app_colors.dart';
import 'package:tuchtrip_staff_portal/view/Dashboard/dashboard.dart';
import 'package:tuchtrip_staff_portal/view/Profile/profile.dart';
import 'package:tuchtrip_staff_portal/view/Recent%20Activity/recentactivity.dart';
import 'package:tuchtrip_staff_portal/view/Service%20Requests/service_requests.dart';
import 'package:tuchtrip_staff_portal/view/Restuarent/dashboard.dart';
import 'package:tuchtrip_staff_portal/view/Restuarent/orders_screen.dart';
import 'package:tuchtrip_staff_portal/view/Restuarent/recent_activity.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int departmentIndex;

  const CustomBottomNavigationBar({super.key, required this.departmentIndex});

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  // Index to keep track of the selected page
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    // Retrieve the list of pages and icons based on the department index
    final List<Widget> pages = _getPagesForDepartment(widget.departmentIndex);
    final List<IconData> icons = _getIconsForDepartment(widget.departmentIndex);
    final List<IconData> selectedIcons =
        _getSelectedIconsForDepartment(widget.departmentIndex);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: pages.isNotEmpty
          ? pages[pageIndex]
          : const Center(child: Text("Invalid Department")),
      bottomNavigationBar: Container(
        height: height * 0.06,
        decoration: const BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(-0.3, 1),
                blurRadius: 2,
                blurStyle: BlurStyle.normal,
                spreadRadius: 0,
                color: greyShadeLight),
          ],
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                icon: Icon(
                  pageIndex == index ? selectedIcons[index] : icons[index],
                  color: pageIndex == index
                      ? primarycolor
                      : Colors.grey, // Set the color based on selection
                  size: 25,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Function to get pages based on the department index --------------------------------------------------------------------------
  List<Widget> _getPagesForDepartment(int departmentIndex) {
    switch (departmentIndex) {
      case 2: // Restaurant
        return [
          OrderScreen(),
          Orders(),
          RecentactivityRestuarent(),
          const ProfileScreen()
        ];
      default:
        return [
          const HousekeepingDashboard(),
          Recentactivity(),
          const RoomStatus(),
          const ProfileScreen()
        ]; // Default pages if departmentIndex doesn't match
    }
  }

  // Function to get unselected icons based on the department index --------------------------------------------------------------------------
  List<IconData> _getIconsForDepartment(int departmentIndex) {
    switch (departmentIndex) {
      case 2:
        return [
          Icons.home_outlined,
          Icons.alarm,
          Icons.domain_verification_rounded,
          Icons.person_outline
        ];
      default:
        return [
          Icons.home_outlined,
          Icons.alarm_add,
          Icons.domain_verification_rounded,
          Icons.person_outline
        ]; // Default icons if departmentIndex doesn't match
    }
  }

  // Function to get selected icons based on the department index --------------------------------------------------------------------------
  List<IconData> _getSelectedIconsForDepartment(int departmentIndex) {
    switch (departmentIndex) {
      case 2:
        return [
          Icons.home,
          Icons.alarm,
          Icons.domain_verification,
          Icons.person
        ];
      default:
        return [
          Icons.home,
          Icons.restaurant_menu,
          Icons.domain_verification,
          Icons.person
        ]; // Default selected icons if departmentIndex doesn't match
    }
  }
}
