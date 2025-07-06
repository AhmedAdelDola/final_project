import 'package:autism_app/Core/Utils/Assets/images/app_images.dart';
import 'package:autism_app/Features/child_view/splash/name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChildOnBoarding extends StatelessWidget {
  const ChildOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.child_onboarding),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NameInputScreen(),
                            ));
                      },
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Center(
                          child: Text('GET Started',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      )),
                ],
              ),
            )));
  }
}
