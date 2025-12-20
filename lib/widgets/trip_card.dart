import 'package:book_your_truck/utilities/color_utility.dart';
import 'package:book_your_truck/utilities/style_utility.dart';
import 'package:book_your_truck/utilities/text_size_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TripCard extends StatelessWidget
{
  final String status;
  final String time;
  final String price;
  final String image;

  const TripCard({
    super.key,
    required this.status,
    required this.time,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorUtility.cardBorderColor),
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
                  "$status At ",
                  style: StyleUtility.latoRegularBlack13TextStyle.copyWith(
                    fontSize: TextSizeUtility.textSize12,
                  ),
                ),
                const Icon(Icons.access_time, size: 14),
                Text(
                  " $time",
                  style: StyleUtility.latoRegularBlack13TextStyle.copyWith(
                    fontSize: TextSizeUtility.textSize12,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          /// Transporter Row
          Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?img=3",
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //background: #EA580C;
                    Text(
                      "L&T Transporter | 15km",
                      style: StyleUtility.manropeMedium14colorBlack,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "120 Ton",
                      style: StyleUtility.manropeMedium14Color767C8C,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  price,
                  style: StyleUtility.manropeMedium10ColorWhite,
                ),
              ),
            ],
          ),

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
                    height: 32.h,
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
                      "Pune",
                      style: StyleUtility.manropeMedium14Color719191A,
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
                      "City Center Salt Lake...",
                      style: StyleUtility.manropeMedium14Color719191A,
                    ),
                  ],
                ),
              ),

              SizedBox(width: 12.w),

              // Container(
              //   width: 12,height: 12,color: Colors.green,
              // ),
              Container(
                width: 38,
                child: CircleAvatar(
                  backgroundColor: Color(0xFFF1F3F5),
                  child: Icon(Icons.keyboard_arrow_down, size: 24.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _dot(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}