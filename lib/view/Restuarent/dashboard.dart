import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuchtrip_staff_portal/utils/app_colors.dart';
import 'package:tuchtrip_staff_portal/utils/text_styles.dart';
import 'package:tuchtrip_staff_portal/view%20model/restuarent%20provider.dart';
import 'package:tuchtrip_staff_portal/view/Common%20Widget/app_textfield.dart';
import 'package:tuchtrip_staff_portal/view/Registration/signUp_screen.dart';

// Main OrderScreen widget
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
          top: height * 0.05, left: width * 0.03, right: width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox(height * 0.02, width),
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
                color: primarycolor,
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
          sizedBox(height * 0.02, width),

          Text(
            "Good morning",
            style: mediumTextstyle,
          ),
          //Staff name and position==========================================================
          Row(
            children: [
              Text(
                "Alex Abhraham",
                style: mediumTextstylebold,
              ),
              sizedBox(height * 0.01, width * 0.02),
              Container(
                height: height * 0.0239,
                width: width * 0.17,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Color.fromARGB(108, 134, 215, 203)),
                child: Center(
                  child: Text(
                    "Waiter",
                    style: GoogleFonts.poppins(
                        color: primarycolor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
          //========================================================================================
          //Searchbar and soert bar ================================================================
          sizedBox(height * 0.03, width),
          Row(
            children: [
              AppSearchBar(
                  controller: TextEditingController(),
                  hintText: "Serach menu",
                  width: width * 0.80,
                  height: height),
              sizedBox(height * 0.01, width * 0.02),
              Container(
                height: height * 0.060,
                width: width * 0.11,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 205, 205, 205), // Shadow color
                      spreadRadius: 0.5,
                      blurRadius: 2,
                      offset: Offset(0, 1), // Bottom shadow
                    ),
                    BoxShadow(
                      color: Color.fromARGB(255, 239, 239, 239), // Shadow color
                      offset: Offset(1.5, 0), // Right shadow
                    ),
                    BoxShadow(
                      color: Color.fromARGB(255, 205, 205, 205), // Shadow color
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, -1), // Top shadow
                    ),
                    BoxShadow(
                      color: Color.fromARGB(255, 239, 239, 239), // Shadow color
                      offset: Offset(-3, 0), // Left shadow
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.sort_rounded,
                  color: blackShadeColor,
                ),
              )
            ],
          ),
          sizedBox(height * 0.02, width),
          //===============================================================================================
          //Build status row-------------------------------------------------------------------------------
          // _buildStatusRow(height, width),
          sizedBox(height * 0.02, width),

          _buildCategoryTabs(),
          SizedBox(
              height: height * 0.39, child: _buildOrderList(height, width)),
          // sizedBox(height * 0.02, width),

          _buildBottomBar(height, width),
        ],
      ),
    );
  }

// Widget to build the status row at the top using a ListView.builder
  Widget _buildStatusRow(height, width) {
    final statusList = [
      {
        'status': 'Ready To Serve',
        'name': 'Angel',
        'location': 'Outside, 2',
        'items': 3,
        'color': Colors.green
      },
      {
        'status': 'Being Cooked',
        'name': 'Marcus',
        'location': 'Inside, 4',
        'items': 2,
        'color': Colors.orange
      },
      // Add more status items here as needed
    ];

    return Container(
      height: height * 0.12, // Set a fixed height for the row
      // padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Makes the ListView horizontal
        itemCount: statusList.length,
        itemBuilder: (context, index) {
          return Container(
            width: width * 0.500, // Set a fixed width for each tile
            margin: const EdgeInsets.symmetric(
                horizontal: 4.0), // Space between tiles
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: greyShadeLight
                  // (statusList[index]['color'] as Color).withOpacity(0.5),
                  ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(statusList[index]['status'] as String,
                    style: TextStyle(
                        color: statusList[index]['color'] as Color,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 4.0),
                Text(
                  '${statusList[index]['name']}, ${statusList[index]['location']}',
                  style: smallTextStyle,
                ),
                SizedBox(height: 4.0),
                Text(
                  '${statusList[index]['items']} items',
                  style: smallTextStyle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

// Widget to build the category tabs using a ListView.builder
  Widget _buildCategoryTabs() {
    final categories = [
      {'name': 'Favorite', 'icon': Icons.favorite},
      {'name': 'Hot Drink', 'icon': Icons.local_cafe},
      {'name': 'Food', 'icon': Icons.fastfood},
      {'name': 'Soft Drink', 'icon': Icons.local_drink},
    ];

    return Consumer<OrderProvider>(builder: (context, categoryProvider, child) {
      return SizedBox(
        height: 75, // Set a fixed height for the tabs
        child: ListView.builder(
          scrollDirection: Axis.horizontal, // Makes the ListView horizontal
          itemCount: categories.length,
          itemBuilder: (context, index) {
            bool isSelected = index == categoryProvider.selectedCategoryIndex;

            return GestureDetector(
              onTap: () {
                categoryProvider.selectCategory(index);
              },
              child: Container(
                height: 90, width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(09),
                  color: backgroundColor,
                  border: Border.all(
                    color: isSelected
                        ? primarycolor
                        : Color.fromARGB(255, 212, 210, 210),
                    width: 2,
                  ),
                ),
                margin: const EdgeInsets.symmetric(
                    horizontal: 6.0), // Space between tabs
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Icon(
                        categories[index]['icon'] as IconData,
                        color: primarycolor,
                      ),
                    ),
                    SizedBox(height: 4.0), // Space between icon and text
                    Text(
                      categories[index]['name'] as String,
                      style: smallTextStyle,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }

//==============================================================================================================
  // Widget to build the order list with ListView==============================================================
  //=============================================================================================================
  Widget _buildOrderList(height, width) {
    return Consumer<OrderProvider>(
      builder: (context, orderProvider, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: orderProvider.items.length,
          itemBuilder: (context, index) {
            return _buildOrderItem(
                orderProvider.items[index], index, context, height, width);
          },
        );
      },
    );
  }

  // Widget to build individual order items
  Widget _buildOrderItem(
      OrderItem item, int index, BuildContext context, height, width) {
    return Padding(
      padding: EdgeInsets.only(
          top: height * 0.01, right: width * 0.02, left: width * 0.02),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor,
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
              left: width * 0.02,
              right: width * 0.02,
              top: height * 0.02,
              bottom: height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: height * 0.07,
                    width: width * 0.150,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assests/images/cappuccino.jpg"),
                          fit: BoxFit.fill // Placeholder image

                          ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  sizedBox(height * 0.01, width * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: smallTextStylebold,
                      ),
                      Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: smallTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: height * 0.03,
                    width: width * 0.05,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: backgroundColor,
                        border: Border.all(color: greyShadeLight)),
                    child: Center(
                      child: InkWell(
                        child: const Icon(
                          Icons.remove,
                          size: 15,
                          color: blackShadeColor,
                        ),
                        onTap: () {
                          if (item.quantity > 1) {
                            Provider.of<OrderProvider>(context, listen: false)
                                .updateQuantity(index, item.quantity - 1);
                          }
                        },
                      ),
                    ),
                  ),
                  sizedBox(height * 0.01, width * 0.02),
                  Text(
                    '${item.quantity}',
                    style: smallTextStyle,
                  ),
                  sizedBox(height * 0.01, width * 0.02),
                  Container(
                    height: height * 0.03,
                    width: width * 0.05,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: backgroundColor,
                        border: Border.all(color: greyShadeLight)),
                    child: InkWell(
                      child: const Icon(
                        Icons.add,
                        size: 15,
                        color: blackShadeColor,
                      ),
                      onTap: () {
                        Provider.of<OrderProvider>(context, listen: false)
                            .updateQuantity(index, item.quantity + 1);
                      },
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

//===============================================================================================================================
  // Widget to build the bottom bar with the total items and price===============================================================
  //=============================================================================================================================
  Widget _buildBottomBar(height, width) {
    return Consumer<OrderProvider>(
      builder: (context, orderProvider, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: primarycolor,
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: height * 0.01,
                bottom: height * 0.02,
                left: width * 0.02,
                right: width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Proceed New Order',
                  style: smallTextstylewhite,
                ),
                Text(
                  '${orderProvider.totalItems} Items  \$${orderProvider.totalPrice.toStringAsFixed(2)}',
                  style: smallTextstylewhitebold,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  //==============================================================================================================
  //==============================================================================================================
}

// OrderItem model to hold individual order details
class OrderItem {
  final String name;
  final double price;
  int quantity;
  final String imagePath; // Add this line for the image path

  OrderItem({
    required this.name,
    required this.price,
    this.quantity = 1,
    required this.imagePath, // Initialize the image path
  });
}
