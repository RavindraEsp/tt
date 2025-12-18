import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilities/style_utility.dart';
import '../../utilities/text_size_utility.dart';

class SimpleTextField extends StatelessWidget {
  const SimpleTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.title,
    this.textInputType,
    this.passwordObscure = false,
    this.onPrefixIconTap,
    this.ontapObscure,
    this.maxLine = 1,
    this.inputFormatter,
    this.preffixImage,
    this.validator,
    this.isEnable = true,
    this.maxLength,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String title;
  final TextInputType? textInputType;
  final bool? passwordObscure;
  final int? maxLine;
  final List<TextInputFormatter>? inputFormatter;
  final VoidCallback? onPrefixIconTap;
  final VoidCallback? ontapObscure;
  final String? preffixImage;

  final FormFieldValidator? validator;
  final bool? isEnable;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: .start,
      children: [
        Text(title,style: StyleUtility.inputTextStyle,),
        SizedBox(height: 7.h),
        SizedBox(
          height: 48,
          child: TextFormField(
            maxLength: maxLength,
            enabled: isEnable,
            obscureText: passwordObscure ?? false,
            controller: controller,
            validator: validator,
            textAlign: TextAlign.start,
            keyboardType: textInputType ?? TextInputType.text,
            maxLines: maxLine ?? 1,
            style: StyleUtility.inputTextStyle,
            textAlignVertical: TextAlignVertical.center,
            inputFormatters: inputFormatter,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(
                left: 20.w,
                // top: 16,
                // bottom: 16,
                right: 5.w,
              ),
              filled: true,
              fillColor: Colors.white,
              hintStyle: StyleUtility.hintTextStyle,
              hintText: hintText,
              labelStyle: StyleUtility.labelTextStyle.copyWith(
                fontSize: TextSizeUtility.textSize13.sp,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide.none,
              ),
              errorStyle: StyleUtility.errorTextStyle.copyWith(
                fontSize: TextSizeUtility.textSize13.sp,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide.none,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide.none,
              ),

              prefixIcon: preffixImage != null
                  ? Padding(
                    padding:  EdgeInsets.all(12.sp),
                    child: Image.asset(preffixImage!),
                  )
                  : null,
              focusColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
