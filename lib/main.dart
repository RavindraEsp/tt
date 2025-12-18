import 'package:book_your_truck/utilities/enums.dart';
import 'package:book_your_truck/utilities/image_utility.dart';
import 'package:book_your_truck/widgets/buttons/custom_button.dart';
import 'package:book_your_truck/widgets/textField/simple_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'module/auth/login_screen.dart';
import 'module/auth/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
     // child:  SignupScreen(),
      child:  LoginScreen(
      ),
    );
  }
}
