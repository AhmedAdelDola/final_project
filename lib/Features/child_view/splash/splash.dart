import 'package:autism_app/Core/Utils/Assets/images/app_images.dart';
import 'package:autism_app/Features/child_view/splash/onboarding.dart';
import 'package:flutter/material.dart';

class ChildSplash extends StatefulWidget {
  const ChildSplash({super.key});

  @override
  State<ChildSplash> createState() => _ChildSplashState();
}

class _ChildSplashState extends State<ChildSplash> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChildOnBoarding(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        AppImages.childSplash,
        fit: BoxFit.cover,
      ),
    ));
  }
}
