import 'package:flutter/material.dart';
import 'package:tuchtrip_staff_portal/utils/app_colors.dart';
import 'package:tuchtrip_staff_portal/view/Dashboard/bellboys_dashboard.dart';
import 'package:tuchtrip_staff_portal/view/Dashboard/laundry_dashboard.dart';
import 'package:tuchtrip_staff_portal/view/Dashboard/restaurant_dashboard.dart';
import 'package:tuchtrip_staff_portal/view/Profile/profile.dart';
import 'package:tuchtrip_staff_portal/view/Recent%20Activity/recent_screen.dart';
import 'package:tuchtrip_staff_portal/view/Room%20Service/room_service.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int departmentIndex;

  CustomBottomNavigationBar({required this.departmentIndex});

  @override
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
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: height * 0.09,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 5, 106, 122),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                icon: Icon(
                  pageIndex == index ? selectedIcons[index] : icons[index],
                  color: Colors.white,
                  size: 35,
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
      case 0: // Bellboys
        return [
          BellboysDashboard(),
          RoomManagementScreen(),
          RecentActivity(),
          ProfileScreen()
        ];
      case 1: // Laundry
        return [
          LaundryDashboard(),
          RoomManagementScreen(),
          RecentActivity(),
          ProfileScreen()
        ];
      case 2: // Restaurant
        return [
          RestaurantDashboard(),
          RoomManagementScreen(),
          RecentActivity(),
          ProfileScreen()
        ];
      default:
        return [];
    }
  }

  // Function to get unselected icons based on the department index --------------------------------------------------------------------------
  List<IconData> _getIconsForDepartment(int departmentIndex) {
    switch (departmentIndex) {
      case 0:
        return [
          Icons.home_outlined,
          Icons.room_service_outlined,
          Icons.recent_actors_outlined,
          Icons.person_outline
        ];
      case 1:
        return [
          Icons.home_outlined,
          Icons.local_laundry_service_outlined,
          Icons.domain_verification,
          Icons.person_outline
        ];
      case 2:
        return [
          Icons.home_outlined,
          Icons.restaurant_menu_outlined,
          Icons.recent_actors_outlined,
          Icons.person_outline
        ];
      default:
        return [
          Icons.home_outlined,
          Icons.work_outline_outlined,
          Icons.widgets_outlined,
          Icons.person_outline
        ];
    }
  }

  // Function to get selected icons based on the department index --------------------------------------------------------------------------
  List<IconData> _getSelectedIconsForDepartment(int departmentIndex) {
    switch (departmentIndex) {
      case 0:
        return [
          Icons.home,
          Icons.room_service,
          Icons.recent_actors,
          Icons.person
        ];
      case 1:
        return [
          Icons.home,
          Icons.local_laundry_service,
          Icons.domain_verification_rounded,
          Icons.person
        ];
      case 2:
        return [
          Icons.home,
          Icons.restaurant_menu_outlined,
          Icons.domain_verification_rounded,
          Icons.person
        ];
      default:
        return [
          Icons.home,
          Icons.work_rounded,
          Icons.domain_verification_rounded,
          Icons.person
        ];
    }
  }
}
