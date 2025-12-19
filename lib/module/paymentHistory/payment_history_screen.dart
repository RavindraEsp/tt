import 'package:book_your_truck/utilities/color_utility.dart';
import 'package:book_your_truck/utilities/image_utility.dart';
import 'package:book_your_truck/utilities/style_utility.dart';
import 'package:book_your_truck/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.backgroundColor,
      appBar: commonAppBar(title: "Payment History"),

      body: ListView.builder(
        itemCount: 11,
        itemBuilder: (context, index) {
          return Container(

            decoration:BoxDecoration(
             // border: Border.all(color: ColorUtility.colorF0F1F5)
              border: Border.all(color: ColorUtility.colorB1B1B1.withValues(alpha: 0.7)),
              borderRadius: BorderRadius.circular(10.r)
            ),
            margin:EdgeInsets.only(top: 5.h,bottom: 5.h,left: 16.w,right: 16.w),
            padding: EdgeInsets.all(17.w),

            child: Row(
              children: [
                Image.asset(ImageUtility.truckIcon,color: ColorUtility.colorEA580C, width: 42.w, height: 42.w),


                SizedBox(width: 16.w,),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        "L&T Transport",
                        style: StyleUtility.manropeMedium16Color1E1E2D,
                      ),

                      SizedBox(height: 8.h),
                      Text(
                        "12:10 PM",
                        style: StyleUtility.manropeMedium14Color767C8C,
                      ),
                    ],
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "₹3522",
                      style: StyleUtility.manropeMedium16Color1E1E2D,
                    ),

                    SizedBox(height: 8.h),
                    Text(
                      "Receive",
                      style: StyleUtility.manropeMedium14Color767C8C,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
