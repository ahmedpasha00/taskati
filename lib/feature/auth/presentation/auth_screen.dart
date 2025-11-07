import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/routes/routes.dart';
import 'package:taskati/core/widgets/coustom_botton.dart';
import 'package:taskati/feature/auth/data/models/user_model.dart';
import 'package:taskati/feature/auth/presentation/cubit/auth_cubit.dart';

import '../../../gen/assets.gen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? photo;
  var nameContontroller = TextEditingController();

  openCamera() async {
    photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  openGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  void dispose() {
    nameContontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: photo != null,

                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: Image.file(File(photo?.path ?? "")).image,
                ),

                replacement: Image.asset(
                  Assets.images.user1.path,
                  height: 200.h,
                  width: 200.w,
                ),
              ),

              SizedBox(height: 20.h),

              CoustomBotton(
                onTap: () {
                  openCamera();
                },
                titel: 'Upload From Camera',
              ),
              SizedBox(height: 20.h),
              CoustomBotton(
                onTap: () {
                  openGallery();
                },
                titel: 'Upload From Gallery',
              ),
              Divider(height: 50.h),

              TextFormField(
                controller: nameContontroller,
                decoration: InputDecoration(
                  hintText: "Enter Your Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is SaveUserSuccess) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.homeScreen,
                      (e) => false,
                    );
                  }
                },
                child: CoustomBotton(
                  onTap: () {
                    context.read<AuthCubit>().saveUserData(
                      UserModel(
                        image: photo?.path ?? "",
                        name: nameContontroller.text,
                      ),
                    );
                  },
                  titel: 'S A V E',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
