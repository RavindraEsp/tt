import 'package:book_your_truck/utilities/color_utility.dart';
import 'package:book_your_truck/utilities/enums.dart';
import 'package:book_your_truck/utilities/style_utility.dart';
import 'package:book_your_truck/utilities/text_size_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../utilities/style_utility.dart';
//
// class CustomButton extends StatelessWidget {
//   final String buttonText;
//   final VoidCallback onTap;
//   final ButtonType? buttonType;
//
//   const CustomButton({
//     super.key,
//     required this.buttonText,
//     required this.onTap, this.buttonType,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final borderRadius = BorderRadius.circular(30.r);
//     return
//
//       buttonType == ButtonType.border ?
//       Container(
//         height: TextSizeUtility.buttonHeight,
//
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           color: ColorUtility.colorE03939,
//           borderRadius: borderRadius,
//         ),
//         child: ElevatedButton(
//           onPressed: () {
//             onTap();
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.transparent,
//             shadowColor: Colors.transparent.withOpacity(0.1),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30.r),
//             ),
//           ),
//           child: Center(
//             child: Text(
//               buttonText,
//               maxLines: 1,
//               style: StyleUtility.buttonTextStyle,
//             ),
//           ),
//         ),
//       ):
//
//
//       Container(
//       height: TextSizeUtility.buttonHeight,
//
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         color: ColorUtility.colorE03939,
//         borderRadius: borderRadius,
//       ),
//       child: ElevatedButton(
//         onPressed: () {
//           onTap();
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent.withOpacity(0.1),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30.r),
//           ),
//         ),
//         child: Center(
//           child: Text(
//             buttonText,
//             maxLines: 1,
//             style: StyleUtility.buttonTextStyle,
//           ),
//         ),
//       ),
//     );
//   }
// }


class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final ButtonType type;
  final Color borderColor;
  final Color textColor;
  final Color backgroundColor;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.type = ButtonType.fill,
    this.borderColor = ColorUtility.colorEA580C,
    this.textColor = Colors.white,
    this.backgroundColor = ColorUtility.colorEA580C,
  });


  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(30.r);

    return Container(
      height: TextSizeUtility.buttonHeight,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: type == ButtonType.fill
            ? backgroundColor
            : Colors.transparent,
        borderRadius: borderRadius,
        border: type == ButtonType.border
            ? Border.all(color: borderColor, width: 1.5)
            : null,
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            maxLines: 1,
            style: StyleUtility.buttonTextStyle.copyWith(
              color: type == ButtonType.border
                  ? ColorUtility.colorEA580C

                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
