import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/theme/app_text_style.dart';
import 'package:taskati/feature/home/data/repo/home_repo.dart';

import '../../../core/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(HomeRepo.getUserData()?.name??"",style: AppTextStyle.font20Bold,),
                  CircleAvatar(
                    radius: 40,
backgroundImage: Image.file(File(HomeRepo.getUserData()?.image??"")).image,
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, size: 30),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.settingScreen);
                    },

                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
