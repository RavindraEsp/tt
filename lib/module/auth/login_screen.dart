import 'package:book_your_truck/module/auth/signup_screen.dart';
import 'package:book_your_truck/utilities/color_utility.dart';
import 'package:book_your_truck/utilities/enums.dart';
import 'package:book_your_truck/utilities/image_utility.dart';
import 'package:book_your_truck/utilities/style_utility.dart';
import 'package:book_your_truck/utilities/text_size_utility.dart';
import 'package:book_your_truck/widgets/buttons/custom_button.dart';
import 'package:book_your_truck/widgets/textField/simple_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectIndex = 0;

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFFF6A00),
      // resizeToAvoidBottomInset: true,
      body:
          // SafeArea(
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         // ORANGE HEADER
          //         Container(
          //           height: size.height * 0.50,
          //           width: double.infinity,
          //           decoration: const BoxDecoration(color: Color(0xFFFF6A00)),
          //           child: Center(
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children:  [
          //               Image.asset(ImageUtility.truckIcon,
          //
          //               width: 197.w,)
          //                 ,
          //
          //               ],
          //             ),
          //           ),
          //         ),
          //
          //         // WHITE CARD SECTION
          //         Container(
          //           width: double.infinity,
          //           padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
          //           decoration:  BoxDecoration(
          //            // color: ColorUtility.colorF5F6FA,
          //             color: ColorUtility.colorF5F6FA,
          //             borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          //           ),
          //
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 "Sign in with",
          //                 style: StyleUtility.latoRegular18BlackTextStyle,
          //               ),
          //
          //               SizedBox(height: 21.h),
          //
          //               Row(
          //                 children: [
          //                   Expanded(
          //                     child: OutlinedButton.icon(
          //                       onPressed: () {
          //                         selectIndex = 0;
          //                         setState(() {});
          //                         print("Value is #$selectIndex");
          //                       },
          //                       icon: Icon(
          //                         Icons.phone,
          //                         color: selectIndex == 0
          //                             ? Colors.orange
          //                             : Colors.grey,
          //                       ),
          //                       label: Text(
          //                         "Mobile Number",
          //                         style: StyleUtility
          //                             .lato15RegularcolorEA580CTextStyle
          //                             .copyWith(
          //                               fontSize: TextSizeUtility.textSize10,
          //                               color: selectIndex == 0
          //                                   ? ColorUtility.colorEA580C
          //                                   : ColorUtility.colorB1B1B1,
          //                             ),
          //                       ),
          //                       style: OutlinedButton.styleFrom(
          //                         side: BorderSide(
          //                           color: selectIndex == 0
          //                               ? ColorUtility.colorEA580C
          //                               : ColorUtility.colorB1B1B1,
          //                         ),
          //                         foregroundColor: Colors.orange,
          //                         shape: RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(30),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   const SizedBox(width: 10),
          //                   Expanded(
          //                     child: OutlinedButton.icon(
          //                       onPressed: () {
          //                         setState(() {
          //                           selectIndex = 1;
          //                         });
          //
          //                         print("Value is #$selectIndex");
          //                       },
          //                       icon: Icon(
          //                         Icons.email,
          //                         color: selectIndex == 1
          //                             ? ColorUtility.colorEA580C
          //                             : ColorUtility.colorB1B1B1,
          //                       ),
          //                       label: Text(
          //                         "Email ID",
          //
          //                         style: StyleUtility
          //                             .lato15RegularcolorEA580CTextStyle
          //                             .copyWith(
          //                               fontSize: TextSizeUtility.textSize10,
          //
          //                               color: selectIndex == 1
          //                                   ? ColorUtility.colorEA580C
          //                                   : ColorUtility.colorB1B1B1,
          //                             ),
          //                       ),
          //                       style: OutlinedButton.styleFrom(
          //                         side: BorderSide(
          //                           color: selectIndex == 1
          //                               ? Colors.orange
          //                               : Colors.grey,
          //                         ),
          //                         foregroundColor: Colors.orange,
          //                         shape: RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(30),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //
          //               SizedBox(height: 19.h),
          //
          //               selectIndex == 0
          //                   ? SimpleTextField(
          //                       controller: mobileNumberController,
          //                       hintText: "Enyer",
          //                       title: "Mobile Number",
          //                     )
          //                   : SimpleTextField(
          //                       controller: mobileNumberController,
          //                       hintText: "Enter your Email ID",
          //                       title: "Email",
          //                     ),
          //               SizedBox(height: 18.h),
          //
          //               CustomButton(buttonText: "Get OTP", onTap: () {}),
          //
          //               Padding(
          //                 padding: EdgeInsets.symmetric(vertical: 26.h),
          //                 child: Row(
          //                   children: [
          //                     Expanded(
          //                       child: Container(
          //                         height: 1,
          //                         color: ColorUtility.colorEA580C,
          //                       ),
          //                     ),
          //
          //                     Padding(
          //                       padding: EdgeInsets.symmetric(horizontal: 13.w),
          //                       child: Text(
          //                         "Don’t have an Account",
          //
          //                         style: StyleUtility.latoRegularBlack13TextStyle,
          //                       ),
          //                     ),
          //
          //                     Expanded(
          //                       child: Container(
          //                         height: 1,
          //                         color: ColorUtility.colorEA580C,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //
          //               CustomButton(
          //                 buttonText: "Sign Up",
          //
          //                 type: ButtonType.border,
          //                 onTap: () {},
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          /// ORANGE HEADER (fills remaining space)
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFF6A00),
                              ),
                              child: Center(
                                child: Image.asset(
                                  ImageUtility.truckIcon,
                                  width: 197.w,
                                ),
                              ),
                            ),
                          ),

                          /// WHITE CARD (takes only required height)
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 22.w,
                              vertical: 22.h,
                            ),
                            decoration: BoxDecoration(
                              color: ColorUtility.colorF5F6FA,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sign in with",
                                  style:
                                      StyleUtility.latoRegular18BlackTextStyle,
                                ),

                                SizedBox(height: 21.h),

                                /// Buttons row
                                ///
                                ///    Row(
                                //                 children: [
                                //                   Expanded(
                                //                     child: InkWell(
                                //                       onTap: () {
                                //                         setState(() {
                                //                           gender = 2;
                                //                         });
                                //                       },
                                //                       child: Container(
                                //                         height: TextSizeUtility.buttonHeight,
                                //                         decoration: BoxDecoration(
                                //                           borderRadius: BorderRadius.circular(50.r),
                                //                           color: gender == 2
                                //                               ? ColorUtility.colorEA580C
                                //                               : Colors.white,
                                //                         ),
                                //
                                //                         child: Row(
                                //                           crossAxisAlignment: CrossAxisAlignment.center,
                                //                           mainAxisAlignment: MainAxisAlignment.center,
                                //                           children: [
                                //                           Image.asset(ImageUtility.femaleIcon,width: 12.w,
                                //                             color: gender == 2
                                //                                 ? Colors.white
                                //                                 : ColorUtility.color767C8C,),
                                //
                                //                             SizedBox(width: 7.w),
                                //
                                //                             Text(
                                //                               "Female",
                                //                               style: StyleUtility.buttonTextStyle.copyWith(
                                //                                 color: gender == 2
                                //                                     ? Colors.white
                                //                                     : ColorUtility.color767C8C,
                                //                               ),
                                //                             ),
                                //                           ],
                                //                         ),
                                //                       ),
                                //                     ),
                                //                   ),
                                //
                                //                   SizedBox(width: 20.w),
                                //
                                //                   Expanded(
                                //                     child: InkWell(
                                //                       onTap: () {
                                //                         setState(() {
                                //                           gender = 1;
                                //                         });
                                //                       },
                                //                       child: Container(
                                //                         height: TextSizeUtility.buttonHeight,
                                //                         decoration: BoxDecoration(
                                //                           borderRadius: BorderRadius.circular(20.r),
                                //                           color: gender == 1
                                //                               ? ColorUtility.colorEA580C
                                //                               : Colors.white,
                                //                         ),
                                //
                                //                         child: Row(
                                //                           crossAxisAlignment: CrossAxisAlignment.center,
                                //                           mainAxisAlignment: MainAxisAlignment.center,
                                //                           children: [
                                //                             Image.asset(ImageUtility.maleIcon,width: 12.w,
                                //
                                //                               color: gender == 1
                                //                                   ? Colors.white
                                //                                   : ColorUtility.color767C8C,
                                //                             ),
                                //
                                //                             SizedBox(width: 7.w),
                                //
                                //                             Text(
                                //                               "Male",
                                //                               style: StyleUtility.buttonTextStyle.copyWith(
                                //                                 color: gender == 1
                                //                                     ? Colors.white
                                //                                     : ColorUtility.color767C8C,
                                //                               ),
                                //                             ),
                                //                           ],
                                //                         ),
                                //                       ),
                                //                     ),
                                //                   ),
                                //                 ],
                                //               ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectIndex = 0;
                                          });
                                        },
                                        child: Container(
                                          height: TextSizeUtility.buttonHeight,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                            border: Border.all(
                                              color: selectIndex == 0
                                                  ? ColorUtility.colorEA580C
                                                  : ColorUtility.color767C8C,
                                            ),
                                          ),

                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                ImageUtility.maleIcon,
                                                width: 12.w,

                                                color: selectIndex == 0
                                                    ? ColorUtility.colorEA580C
                                                    : ColorUtility.color767C8C,
                                              ),

                                              SizedBox(width: 7.w),

                                              Text(
                                                "Mobile Number",
                                                style: StyleUtility
                                                    .lato15RegularcolorEA580CTextStyle
                                                    .copyWith(
                                                      // fontSize:
                                                      // TextSizeUtility.textSize10,
                                                      color: selectIndex == 0
                                                          ? ColorUtility
                                                                .colorEA580C
                                                          : ColorUtility
                                                                .colorB1B1B1,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 10),

                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectIndex = 1;
                                          });
                                        },
                                        child: Container(
                                          height: TextSizeUtility.buttonHeight,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                            border: Border.all(
                                              color: selectIndex == 1
                                                  ? ColorUtility.colorEA580C
                                                  : ColorUtility.color767C8C,
                                            ),
                                          ),

                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                ImageUtility.maleIcon,
                                                width: 12.w,

                                                color: selectIndex == 1
                                                    ? ColorUtility.colorEA580C
                                                    : ColorUtility.color767C8C,
                                              ),

                                              SizedBox(width: 7.w),

                                              Text(
                                                "Email ID",
                                                style: StyleUtility
                                                    .lato15RegularcolorEA580CTextStyle
                                                    .copyWith(
                                                      // fontSize:
                                                      // TextSizeUtility.textSize10,
                                                      color: selectIndex == 1
                                                          ? ColorUtility
                                                                .colorEA580C
                                                          : ColorUtility
                                                                .colorB1B1B1,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 19.h),

                                selectIndex == 0
                                    ? SimpleTextField(
                                        controller: mobileNumberController,
                                        hintText: "Enter",
                                        title: "Mobile Number",
                                      )
                                    : SimpleTextField(
                                        controller: mobileNumberController,
                                        hintText: "Enter your Email ID",
                                        title: "Email",
                                      ),

                                SizedBox(height: 18.h),

                                CustomButton(
                                  buttonText: "Get OTP",
                                  onTap: () {},
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 26.h),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 1,
                                          color: ColorUtility.colorEA580C,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 13.w,
                                        ),
                                        child: Text(
                                          "Don’t have an Account",
                                          style: StyleUtility
                                              .latoRegularBlack13TextStyle,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 1,
                                          color: ColorUtility.colorEA580C,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                CustomButton(
                                  buttonText: "Sign Up",
                                  type: ButtonType.border,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignupScreen(),
                                      ),
                                    );
                                  },
                                ),

                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
    );
  }
}
