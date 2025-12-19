
import 'package:book_your_truck/utilities/color_utility.dart';
import 'package:book_your_truck/utilities/image_utility.dart';
import 'package:book_your_truck/utilities/style_utility.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilities/text_size_utility.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/textField/mobile_number_text_field.dart';
import '../../widgets/textField/simple_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {


  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController gstController = TextEditingController();

  String? countryCode;

  int? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 45.h),

                Container(
                  width: 135,
                  height: 135,
                  child: ClipOval(
                    child: cachedNetworkImageCustom(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStvL8kNVKvJskGpi8do02RNw2bn3sKxTTJ2g&s"   ),
                  ),
                ),

                SizedBox(height: 15.h),

                Text(
                  "Ravi JI",
                  style: StyleUtility.nunitoBold16colorBlackTextStyle,
                ),

                SizedBox(height: 5.h),
                Text(
                  "+91 12345 67890",
                  style: StyleUtility.nunitoRegular14color364B63TextStyle,
                ),

                SizedBox(height: 18.h),

                SimpleTextField(
                  preffixImage: ImageUtility.userIcon,
                  title: "First Name",
                  controller: fNameController,
                  hintText: "Enter first name",
                ),

                SizedBox(height: 16.h),

                SimpleTextField(
                  preffixImage: ImageUtility.userIcon,
                  title: "Last Name",
                  controller: lNameController,
                  hintText: "Enter last name",
                ),

                SizedBox(height: 16.h),

                SimpleTextField(
                  preffixImage: ImageUtility.emailIcon,
                  title: "Email",
                  controller: emailController,
                  hintText: "Enter email",
                ),

                SizedBox(height: 16.h),

                SimpleTextField(
                  preffixImage: ImageUtility.gstIcon,
                  title: "GST Number",
                  controller: emailController,
                  hintText: "Enter GST number",
                ),

                SizedBox(height: 16.h),

                PhoneNumberTextField(
                  controller: mobileController,
                  initialCountryCode: 'IN',
                  onChanged: (value) {
                    print("Value number${value!.completeNumber}");
                    countryCode = value.countryCode;
                    print("country code is from input number ${countryCode}");
                    return null;
                  },
                  hintText: "Enter your mobile number",
                ),
                SizedBox(height: 16.h),

                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            gender = 2;
                          });
                        },
                        child: Container(
                          height: TextSizeUtility.buttonHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: gender == 2
                                ? ColorUtility.colorEA580C
                                : Colors.white,
                          ),

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageUtility.femaleIcon,
                                width: 12.w,
                                color: gender == 2
                                    ? Colors.white
                                    : ColorUtility.color767C8C,
                              ),

                              SizedBox(width: 7.w),

                              Text(
                                "Female",
                                style: StyleUtility.buttonTextStyle.copyWith(
                                  color: gender == 2
                                      ? Colors.white
                                      : ColorUtility.color767C8C,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 20.w),

                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            gender = 1;
                          });
                        },
                        child: Container(
                          height: TextSizeUtility.buttonHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: gender == 1
                                ? ColorUtility.colorEA580C
                                : Colors.white,
                          ),

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageUtility.maleIcon,
                                width: 12.w,

                                color: gender == 1
                                    ? Colors.white
                                    : ColorUtility.color767C8C,
                              ),

                              SizedBox(width: 7.w),

                              Text(
                                "Male",
                                style: StyleUtility.buttonTextStyle.copyWith(
                                  color: gender == 1
                                      ? Colors.white
                                      : ColorUtility.color767C8C,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 32.h),
                CustomButton(buttonText: "Update Profile", onTap: () {}),

                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget cachedNetworkImageCustom(
    String imgUrl, {
      String errorImgUrl = '',
      bool fit = false,
      IconData errorIcon = Icons.error,
    }) {
  return imgUrl == ''
      ? Image.asset(errorImgUrl, fit: BoxFit.contain)
      : CachedNetworkImage(
    imageUrl: imgUrl,
    placeholder: (context, url) =>
    const Center(child: CircularProgressIndicator()),
    errorWidget: (context, url, error) => errorImgUrl == ''
        ? const Icon(Icons.error, color: Colors.red)
        : Image.asset(errorImgUrl, fit: BoxFit.contain),
    fit: fit ? BoxFit.contain : BoxFit.cover,
  );
}

class SettingTile extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSuffix;

  const SettingTile({
    super.key,
    required this.title,
    required this.icon,
    this.isSuffix = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(15.w),
        child: Row(
          children: [
            Image.asset(icon, width: 22.w),

            SizedBox(width: 12.w),

            Expanded(
              child: Text(
                title,
                style: StyleUtility.nunitoSemiBold15color132235TextStyle,
              ),
            ),

            isSuffix == true
                ? Image.asset(
              ImageUtility.arrowRightIcon,
              width: 18.w,
              fit: BoxFit.contain,
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
