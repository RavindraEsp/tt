import 'package:book_your_truck/utilities/color_utility.dart';
import 'package:book_your_truck/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utilities/style_utility.dart';
import '../../../../utilities/text_size_utility.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: commonAppBar(title: "Booking  Details"),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SizedBox(height: 12),
          _RouteDetailsCard(),
          SizedBox(height: 16),
          _TransporterCard(),
          SizedBox(height: 16),
          _BasicDetailsCard(),
          SizedBox(height: 16),
          _FareDetailsCard(),
        ],
      ),
    );
  }
}

class _RouteDetailsCard extends StatelessWidget {
  const _RouteDetailsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorUtility.cardBorderColor2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Status
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: ColorUtility.colorF0F1F5,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Completed At ",
                  style: StyleUtility.latoRegularBlack13TextStyle.copyWith(
                    fontSize: TextSizeUtility.textSize12,
                  ),
                ),
                const Icon(Icons.access_time, size: 14),
                Text(
                  " 12 Pm",
                  style: StyleUtility.latoRegularBlack13TextStyle.copyWith(
                    fontSize: TextSizeUtility.textSize12,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          /// Transporter Row
          Text(
            "L&T Transporter | 15km",
            style: StyleUtility.manropeMedium14colorBlack,
          ),
          SizedBox(height: 4),
          Text("120 Ton", style: StyleUtility.manropeMedium14Color767C8C),

          SizedBox(height: 20.h),

          /// Locations
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  _dot(Colors.green),
                  Container(
                    width: 2,
                    height: 72.h,
                    color: Colors.grey.shade300,
                  ),
                  _dot(Colors.red),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Uploading : 01 Jan 202, 11:47AM",
                      style: StyleUtility.manropeMedium14Color719191A,
                    ),

                    SizedBox(height: 4.h),
                    Text(
                      "Bus Sta Upas, Factory, Bengaluru, Karnataka 560009",
                      style: StyleUtility.nunitoRegular13color132235TextStyle,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: ColorUtility.colorF0F1F5,
                      ),
                    ),
                    Text(
                      "Uploading : 01 Jan 202, 11:47AM",
                      style: StyleUtility.manropeMedium14Color719191A,
                    ),

                    SizedBox(height: 4.h),
                    Text(
                      "M.G. Railway Colony, Majestic, Bengaluru, Karnataka 560023",
                      style: StyleUtility.nunitoRegular13color132235TextStyle,
                    ),
                  ],
                ),
              ),

              SizedBox(width: 12.w),

              // Container(
              //   width: 12,height: 12,color: Colors.green,
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dot(Color color) {
    return Container(
      width: 14.sp,
      height: 14.sp,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _TransporterCard extends StatelessWidget {
  const _TransporterCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorUtility.cardBorderColor2),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "L&T Transporter",
                  style: StyleUtility.nunitobold13colorBlackTextStyle,
                ),
                SizedBox(height: 9.h),
                Text(
                  "Contact us",
                  style: StyleUtility.nunitoRegular13color132235TextStyle
                      .copyWith(fontSize: TextSizeUtility.textSize15),
                ),
              ],
            ),
          ),
          _iconButton(Icons.chat_bubble_outline),
          SizedBox(width: 12.w),
          _iconButton(Icons.call),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFF7F8FA),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(9.w),
        child: Icon(icon, color: Colors.deepOrange, size: 18.sp),
      ),
    );
  }
}

class _BasicDetailsCard extends StatelessWidget {
  const _BasicDetailsCard();

  @override
  Widget build(BuildContext context) {
    return _infoCard(
      title: "BASIC DETAILS",
      children: const [
        _InfoRow("Booking ID", "#0CAC6C64"),
        _InfoRow("Transporter", "L&T Transporter"),
        _InfoRow("Trip Distance", "89.36 km"),
        _InfoRow("Trip Duration", "3h 00min"),
        _InfoRow("Vehicle Type", "Truck Container"),
      ],
    );
  }
}

class _FareDetailsCard extends StatelessWidget {
  const _FareDetailsCard();

  @override
  Widget build(BuildContext context) {
    return _infoCard(
      title: "ESTIMATED FARE DETAILS",
      children: const [_InfoRow("Estimated Total Fare", "₹1500", isBold: true)],
    );
  }
}

Widget _infoCard({required String title, required List<Widget> children}) {
  return Container(
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: ColorUtility.cardBorderColor2),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: StyleUtility.nunitoBold16colorBlackTextStyle.copyWith(
            fontSize: TextSizeUtility.textSize12,
          ),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    ),
  );
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _InfoRow(this.label, this.value, {this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "$label:",
              style: StyleUtility.nunitoRegular13color132235TextStyle.copyWith(
                fontSize: TextSizeUtility.textSize15,
              ),
            ),
          ),
          Text(
            value,
            style: StyleUtility.nunitoRegular13color132235TextStyle.copyWith(
              fontSize: TextSizeUtility.textSize15,
            ),
          ),
        ],
      ),
    );
  }
}
