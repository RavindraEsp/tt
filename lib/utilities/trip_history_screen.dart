import 'package:book_your_truck/utilities/color_utility.dart';
import 'package:book_your_truck/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/trip_card.dart';

class TripsHistoryScreen extends StatelessWidget {
  const TripsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.backgroundColor,
      appBar: commonAppBar(title: "My Bookings"),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 32.h),
          itemCount: 11,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
              child: TripCard(
                status: "Completed",
                time: "12:00 Pm",
                price: "₹1500",
                image: "",
              ),
            );
          },
        ),
      ),
    );
  }
}
