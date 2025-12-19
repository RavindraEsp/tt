import 'package:book_your_truck/utilities/color_utility.dart';
import 'package:book_your_truck/utilities/image_utility.dart';
import 'package:book_your_truck/utilities/style_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int currentIndex = 0;

  List bottombarScreensList = [
    Center(
      child: Column(
        children: [
          SizedBox(height: 100),
          Text("Dashboard", style: StyleUtility.inputTextStyle),
        ],
      ),
    ),
    Center(
      child: Column(
        children: [
          SizedBox(height: 100),
          Text("Second", style: StyleUtility.inputTextStyle),
        ],
      ),
    ),
    Center(
      child: Column(
        children: [
          SizedBox(height: 100),
          Text("third", style: StyleUtility.inputTextStyle),
        ],
      ),
    ),
    Center(
      child: Column(
        children: [
          SizedBox(height: 100),
          Text("Fourth", style: StyleUtility.inputTextStyle),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: ColorUtility.colorEA580C,
        unselectedItemColor: ColorUtility.textFieldBorderColor,
        unselectedFontSize: 12.sp,
        showUnselectedLabels: true,
        selectedLabelStyle: StyleUtility.poppinRegular12colorEA580CTextStyle,
        onTap: (index) async {
          currentIndex = index;

          setState(() {});
        },
        currentIndex: currentIndex,
        items: [
          bottomNavBarItem(currentIndex, 0, "Home", ImageUtility.homeIcon),
          bottomNavBarItem(
            currentIndex,
            1,
            "Bookings",
            ImageUtility.bookingIcon,
          ),
          bottomNavBarItem(currentIndex, 2, "Help", ImageUtility.helpIcon),
          bottomNavBarItem(
            currentIndex,
            3,
            "Profile",
            ImageUtility.profileIcon,
          ),
        ],
      ),

      body: bottombarScreensList[currentIndex],
    );
  }

  BottomNavigationBarItem bottomNavBarItem(
    int currentIndex,
    int itemIndex,
    String lable,
    String iconPath,
  ) {
    return BottomNavigationBarItem(
      icon: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        width: 22.h,
        height: 22.h,
        child: Image.asset(
          color: currentIndex == itemIndex
              ? ColorUtility.colorEA580C
              : ColorUtility.color767C8C,

          iconPath,
          fit: BoxFit.contain,
        ),
      ),
      label: lable,
    );
  }
}
