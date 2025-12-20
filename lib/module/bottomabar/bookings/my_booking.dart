import 'package:book_your_truck/module/bottomabar/bookings/booking_details/booking_details_screen.dart';
import 'package:book_your_truck/utilities/color_utility.dart';
import 'package:book_your_truck/utilities/style_utility.dart';
import 'package:book_your_truck/utilities/text_size_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/trip_card.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  BookingType selectedType = BookingType.upcoming;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF7F8FA),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
        centerTitle: true,
        title: const Text(
          "My Bookings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),

          /// Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: ColorUtility.colorF5F6FA,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  _tabButton("Upcoming", BookingType.upcoming),
                  _tabButton("Completed", BookingType.completed),
                  _tabButton("Cancelled", BookingType.cancelled),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          /// Booking List
          Expanded(
            // child: selectedType == BookingType.completed
            //     ? buildListView(status: "Completed")
            //     : selectedType == BookingType.upcoming
            //     ? buildListView(status: "Scheduled")
            //     : buildListView(status: "Cancelled"),
            child: selectedType == BookingType.upcoming
                ? buildListView(status: "Scheduled")
                : selectedType == BookingType.completed
                ? buildListView(status: "Completed")
                : buildListView(status: "Cancelled"),
          ),
        ],
      ),
    );
  }

  ListView buildListView({required String status}) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 32.h),
      itemCount: 11,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
          child: TripCard(
            status: status,
            time: "12:00 Pm",
            price: "₹1500",
            image: "",
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => BookingDetailsScreen()));

            },
          ),
        );
      },
    );
  }

  Widget _tabButton(String title, BookingType type) {
    final bool isSelected = selectedType == type;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedType = type;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? ColorUtility.colorEA580C : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              title,
              style: StyleUtility.buttonTextStyle.copyWith(
                fontSize: TextSizeUtility.textSize14,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum BookingType { upcoming, completed, cancelled }
