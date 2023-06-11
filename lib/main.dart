import 'package:coffee_ui/screens/intro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/login/src/utils/password_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: PasswordInputView(
        expectedCode: '0000',
        onSuccess: () {
          Get.to(const IntroPage());

        },
        onError: () {
        },
      ),
    );
  }
}
