import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/theme/app_text_style.dart';

class CoustomBotton extends StatelessWidget {
  final String titel;
  final void Function()? onTap;
  const CoustomBotton({super.key, required this.titel, this.onTap, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: LinearGradient(colors: [
            Color(0xFFFC466B), // Hot pink/red
            Color(0xFF6A11CB).withValues(alpha: .5),
            Colors.teal// Purple
          ],

            begin: Alignment.centerRight,
            end: Alignment.bottomCenter,),
        ),
        child: Text(titel,style: AppTextStyle.font20Bold,),
      ),
    );
  }
}
