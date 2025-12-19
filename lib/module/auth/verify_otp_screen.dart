import 'package:book_your_truck/utilities/style_utility.dart';
import 'package:book_your_truck/widgets/buttons/custom_button.dart';
import 'package:book_your_truck/widgets/common_app_bar.dart';
import 'package:book_your_truck/widgets/textField/custom_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilities/color_utility.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  TextEditingController fNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.backgroundColor,
      appBar: commonAppBar(title: "Verify OTP"),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 20.h),
              Text(
                "Otp Verification",
                style: StyleUtility.manropeSemiBold18Color0E0E0E,
              ),
              SizedBox(height: 16.h),
              Text(
                "We just sent you an SMS with 4-digit code. looks like very soon you will be logged in!",
                style: StyleUtility.manropeMedium16Color848B9D,
              ),

              SizedBox(height: 28.h),
              Container(
                alignment: Alignment.center,
                child: CustomOtpField(controller: fNameController),
              ),

              SizedBox(height: 28.h),

              Container(
                alignment: Alignment.center,
                child: Text(
                  "I haven’t received a code (0:03)",
                  style: StyleUtility.manropeMedium16Color848B9D.copyWith(
                    color: Colors.black.withValues(alpha: 0.8),
                  ),
                ),
              ),

              SizedBox(height: 114.h),

              CustomButton(buttonText: "Verify", onTap: () {}),

              SizedBox(height: 35.h),
            ],
          ),
        ),
      ),
    );
  }
}
