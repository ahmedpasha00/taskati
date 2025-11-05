import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/feature/auth/presentation/auth_screen.dart';

import '../../../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    NavigateToNextScreen();
    super.initState();
  }
  NavigateToNextScreen(){
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AuthScreen()), (e)=>false);
    })
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 40.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(Assets.images.splashScreenTaskati),
                SizedBox(height: 10.h),
                Center(
                  child: AnimatedTextKit(
                    animatedTexts: [

                      TypewriterAnimatedText(
                        'Welcome! Start your day by organizing your tasks 💪',
                        textStyle: TextStyle(
                          fontSize: 25.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: Duration(milliseconds: 100),
                      ),
                      ScaleAnimatedText(
                        'Taskati',
                        textStyle: TextStyle(
                          fontSize: 40.0.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        duration: Duration(seconds: 2),
                        scalingFactor: 0.5, // حجم الانطلاق قبل التكبير
                      ),
                    ],
                    totalRepeatCount: 10, // يشغل مرة واحدة فقط
                    pause: Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                    isRepeatingAnimation: true, // يخلي الأنيميشن يخلص ويثبت
                  ),
                ),

                // Text("Taskati", style: TextStyle(fontSize: 20.sp))),
                SizedBox(height: 15.h),
                Text("it,s Time To Organized", style: TextStyle(fontSize: 18.sp)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
