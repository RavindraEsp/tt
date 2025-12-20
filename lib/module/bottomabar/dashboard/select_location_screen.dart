import 'package:book_your_truck/utilities/color_utility.dart';
import 'package:book_your_truck/utilities/image_utility.dart';
import 'package:book_your_truck/utilities/style_utility.dart';
import 'package:book_your_truck/utilities/text_size_utility.dart';
import 'package:book_your_truck/widgets/buttons/custom_button.dart';
import 'package:book_your_truck/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectLocationScreen extends StatelessWidget {
  const SelectLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Select Location"),
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.w),
                children: [
                  _LocationInputCard(),
                  SizedBox(height: 28.h),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16.w),
              child: CustomButton(
                buttonText: "Continue",
                onTap: () {
                  openRideBottomSheet(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openRideBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const RideBottomSheet(),
    );
  }
}

enum RideStep { preference, dateTime }

class RideBottomSheet extends StatefulWidget {
  const RideBottomSheet({super.key});

  @override
  State<RideBottomSheet> createState() => _RideBottomSheetState();
}

class _RideBottomSheetState extends State<RideBottomSheet> {
  RideStep currentStep = RideStep.preference;

  String selectedPreference = "Later";
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildContent(),
            const SizedBox(height: 20),
            _nextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (currentStep) {
      case RideStep.preference:
        return _preferenceCard();
      case RideStep.dateTime:
        return _dateTimeCard();
    }
  }

  Widget _preferenceCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Preference",
          style: StyleUtility.manropeMedium14colorBlack.copyWith(
            fontSize: TextSizeUtility.textSize18,
          ),
        ),
        const SizedBox(height: 16),

        _radioTile("Later", ImageUtility.latterIcon),
        _radioTile("Now", ImageUtility.nowIcon),
      ],
    );
  }

  Widget _radioTile(String title, String image) {
    return ListTile(
      leading: Image.asset(image, width: 28.w,height: 28.w, fit: BoxFit.contain),
      title: Text(title,style: StyleUtility.manropeMedium14colorBlack,),
      trailing: Radio<String>(
        activeColor: ColorUtility.colorEA580C,
        value: title,
        groupValue: selectedPreference,
        onChanged: (val) {
          setState(() => selectedPreference = val!);
        },
      ),
    );
  }

  Widget _dateTimeCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          "Select your date and time",
          style: StyleUtility.manropeMedium14colorBlack.copyWith(
            fontSize: TextSizeUtility.textSize18,
          ),
        ),
        const SizedBox(height: 16),

        _pickerTile(
          icon: ImageUtility.calenderIcon,
          text: selectedDate == null
              ? "Pick right date"
              : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              initialDate: DateTime.now(),
            );
            if (date != null) {
              setState(() => selectedDate = date);
            }
          },
        ),

        const SizedBox(height: 12),

        _pickerTile(
          icon: ImageUtility.timeIcon,
          text: selectedTime == null
              ? "Pick right time"
              : selectedTime!.format(context),
          onTap: () async {

            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    useMaterial3: false, // ✅ IMPORTANT
                  ),

                  child: child!,
                );
              },
            );



            // final time = await showTimePicker(
            //   context: context,
            //   initialTime: TimeOfDay.now(),
            // );
            if (time != null) {
              setState(() => selectedTime = time);
            }
          },
        ),
      ],
    );
  }

  Widget _pickerTile({
    required String icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6FA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset(icon,width:28.w,),
            const SizedBox(width: 12),
            Text(text, style: StyleUtility.hintTextStyle),
          ],
        ),
      ),
    );
  }


  Widget _nextButton() {
    return CustomButton(buttonText: "Next", onTap: (){

      setState(() {
        if (currentStep == RideStep.preference) {
          currentStep = RideStep.dateTime;
        } else {
          Navigator.pop(context);
        }
      });
    });
  }





}

class _LocationInputCard extends StatelessWidget {
  const _LocationInputCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorUtility.color8D98AF),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              _dot(ColorUtility.colorEA580C),
              Container(width: 2, height: 32.h, color: Colors.grey.shade300),
              Image.asset(ImageUtility.unLoadingIconIcon, width: 18.w),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Loading Location?",
                  style: StyleUtility.manropeMedium14Color767C8C,
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(vertical: 8.h),
                  child: Divider(color: ColorUtility.colorF0F2F9),
                ),
                Text(
                  "Unloading Location?",
                  style: StyleUtility.manropeMedium14Color767C8C,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(Color color) {
    return Container(
      width: 12.w,
      height: 12.w,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
