import 'package:book_your_truck/module/bottomabar/bottombar.dart';
import 'package:book_your_truck/utilities/style_utility.dart';
import 'package:book_your_truck/utilities/text_size_utility.dart';
import 'package:book_your_truck/widgets/buttons/custom_button.dart';
import 'package:book_your_truck/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utilities/color_utility.dart';
import '../../../../utilities/image_utility.dart';

class SelectTransporterScreen extends StatefulWidget {
  const SelectTransporterScreen({super.key});

  @override
  State<SelectTransporterScreen> createState() =>
      _SelectTransporterScreenState();
}

class _SelectTransporterScreenState extends State<SelectTransporterScreen> {
  int? selectIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(title: "Select Transporter"),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: 12,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return TransporterCard(
                    eta: index % 3 == 0
                        ? "30 min"
                        : index % 3 == 1
                        ? "40 min"
                        : "45 min",
                    price: "40\$–50\$",
                    image: index % 3,
                    isSelect: index == selectIndex,
                    onTap: () {
                      setState(() {
                        selectIndex = index;
                      });
                    },
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: CustomButton(
                buttonText: "Continue",
                onTap: () {
                  openPaymentBottomSheet(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openPaymentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => PaymentBottomSheet(


        onTap: (){

          openSuccessBottomSheet(context);
        },
      ),
    );
  }

  void openSuccessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const PaymentSuccessView(),
    );
  }


}

class TransporterCard extends StatelessWidget {
  final String eta;
  final String price;
  final int image;
  final bool isSelect;
  final VoidCallback onTap;

  const TransporterCard({
    super.key,
    required this.eta,
    required this.price,
    required this.image,
    required this.isSelect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelect == true
                ? ColorUtility.colorEA580C
                : ColorUtility.cardBorderColor2,
          ),
        ),
        child: Row(
          children: [
            /// Truck Image
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F3F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                image == 0
                    ? Icons.local_shipping
                    : image == 1
                    ? Icons.fire_truck
                    : Icons.delivery_dining,
                size: 35,
                color: ColorUtility.colorEA580C,
              ),
            ),

            const SizedBox(width: 14),

            /// Transporter Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "L&T Transporter",
                    style: StyleUtility.manropeBold14Color1A2530,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "ETA - $eta",
                    style: StyleUtility.manropeMedium14Color8D98AF.copyWith(
                      fontSize: TextSizeUtility.textSize12,
                    ),
                  ),
                ],
              ),
            ),

            /// Price
            Text(price, style: StyleUtility.manropeSemiBold14Color1A2530),
          ],
        ),
      ),
    );
  }
}

class PaymentBottomSheet extends StatefulWidget {

  final VoidCallback onTap;
  const PaymentBottomSheet({super.key, required this.onTap});

  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  String selectedPreference = "Later";

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Payment Method",
                  style: StyleUtility.manropeMedium14colorBlack.copyWith(
                    fontSize: TextSizeUtility.textSize18,
                  ),
                ),
                const SizedBox(height: 16),

                _radioTile("Cash", ImageUtility.latterIcon),
                _radioTile("Phone Pay", ImageUtility.phonePayIcon),
              ],
            ),
            const SizedBox(height: 20),

            CustomButton(buttonText: "Pay Now \$100", onTap: widget.onTap),
          ],
        ),
      ),
    );
  }


  Widget _radioTile(String title, String image) {
    return ListTile(
      leading: Image.asset(
        image,
        width: 28.w,
        height: 28.w,
        fit: BoxFit.contain,
      ),
      title: Text(title, style: StyleUtility.manropeMedium14colorBlack),
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
}

class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 38.h,),
            Image.asset(ImageUtility.successIcon,width: 125.w,),

            SizedBox(height: 28.h,),

            Text(
              "Payment Successful!",
              style: StyleUtility.manropeMedium14colorBlack.copyWith(
                fontSize: TextSizeUtility.textSize18,
              ),
            ),


            SizedBox(height: 10.h,),
            Text(
              "Your payment has been successfully processed.",
              style: StyleUtility.manropeMedium16Color767C8C,
              textAlign: TextAlign.center,
            ),


            SizedBox(height: 28.h,),

            CustomButton(buttonText: "Continue", onTap: () {

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const BottomNavigationBarScreen()),
                    (route) => false, // ❗ removes all previous routes
              );

            }),

          ],
        ),
      ),
    );
  }
}

