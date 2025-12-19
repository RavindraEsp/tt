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
              Text("Otp Verification", style: StyleUtility.inputTextStyle),

              Text("Otp Verification", style: StyleUtility.inputTextStyle),

              SizedBox(height: 40),
              Container(
                alignment: Alignment.center,
                child: CustomOtpField(controller: fNameController),
              ),

              SizedBox(height: 150.h),

              CustomButton(buttonText: "Verify", onTap: () {}),

              SizedBox(height: 35.h),
            ],
          ),
        ),
      ),
    );
  }
}
