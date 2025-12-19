// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:async';

import 'package:book_your_truck/utilities/color_utility.dart';
import 'package:book_your_truck/utilities/style_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    super.key,
    this.controller,
    this.initialValue,
    this.style,
    this.initialCountryCode,
    this.dropdownTextStyle,
    required this.hintText,
    this.hintTextStyle,
    this.textInputType,
    this.onTapTextField,
    this.inputFormatter,
    this.isEnable = true,
    this.onFocusChange,
    this.title,
    this.fillColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.disabledBorderColor,
    this.borderColor,
    this.suffixIcon,
    this.borderRadius,
    this.validators,
    this.onChanged,
    this.disabledBorderRadius,
    this.onCountryChanged,
    this.borderTransparent = false,
    this.borderDisableTransparent = false,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final TextStyle? style;
  final TextStyle? dropdownTextStyle;
  final String? initialCountryCode;
  final String hintText;
  final Color? fillColor;
  final TextStyle? hintTextStyle;
  final TextInputType? textInputType;
  final Color? enabledBorderColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? disabledBorderColor;
  final BorderRadius? disabledBorderRadius;
  final List<TextInputFormatter>? inputFormatter;
  final VoidCallback? onTapTextField;
  final bool? isEnable;
  final Widget? suffixIcon;
  final ValueChanged<bool>? onFocusChange;
  final String? title;
  final BorderRadius? borderRadius;
  final FutureOr<String?> Function(PhoneNumber?)? validators;
  final PhoneNumber? Function(PhoneNumber?)? onChanged;
  final Country? Function(Country?)? onCountryChanged;
  final bool? borderTransparent;
  final bool? borderDisableTransparent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title != null
        //     ? Padding(
        //         padding: EdgeInsets.only(bottom: 8.h),
        //         child: Text(
        //           title ?? "",
        //           style: StyleUtility.ts14white400SoroFBF8FF
        //               .copyWith(fontSize: TextSizeUtility.textSize16.sp),
        //         ))
        //     : SizedBox(),
        IntlPhoneField(
          controller: controller,
          enabled: isEnable ?? true,
          inputFormatters:
          inputFormatter ??
              [
                FilteringTextInputFormatter.deny(
                  RegExp(r'\s'),
                ), // Denies spaces
              ],
          keyboardType: TextInputType.number,
          showCursor: true,
          cursorColor: Colors.black,
          textAlign: TextAlign.start,
          style:

              StyleUtility.inputTextStyle,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
            hintTextStyle ??
                StyleUtility.hintTextStyle,
            contentPadding: EdgeInsets.only(
              left: 20.w,
              // top: 16,
              // bottom: 16,
              right: 5.w,
            ),
            filled: true,
            counterText: "",
            fillColor:  Colors.white,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              // borderSide: BorderSide.none,
              borderSide: const BorderSide(
                color: ColorUtility.textFieldBorderColor,
              ),
            ),
            errorStyle: StyleUtility.errorTextStyle,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: ColorUtility.textFieldBorderColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: ColorUtility.textFieldBorderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: ColorUtility.textFieldBorderColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: ColorUtility.textFieldBorderColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: ColorUtility.textFieldBorderColor,
              ),
            ),

          ),
          validator: (phone) {
            // Custom validation logic
            if (phone == null || phone.number.isEmpty) {
              return 'Phone number is required';
            }
            return null; // If validation passes
          },
          initialValue: initialValue,
          initialCountryCode: initialCountryCode,
          languageCode: "en",
          dropdownIcon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: ColorUtility.textFieldBorderColor,
          ),
          dropdownIconPosition: IconPosition.trailing,
          dropdownTextStyle:
          dropdownTextStyle ?? StyleUtility.inputTextStyle,
          onChanged: onChanged,
          onCountryChanged: onCountryChanged,
          flagsButtonPadding: EdgeInsets.only(left: 5.h),

          pickerDialogStyle: PickerDialogStyle(
            backgroundColor: ColorUtility.backgroundColor,
            searchFieldCursorColor: Colors.black,
            searchFieldInputDecoration: InputDecoration(
              labelStyle: TextStyle(
                  color: Colors.black
              ),
              hintText: 'Search country',
              hintStyle: TextStyle(color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            countryNameStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            countryCodeStyle: TextStyle(color: Colors.black, fontSize: 12.sp),
          ),
        ),
      ],
    );
  }
}
