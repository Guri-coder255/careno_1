import 'dart:developer';

import 'package:careno/AuthSection/screen_login.dart';
import 'package:careno/Host/Views/Screens/screen_host_blocked_user.dart';
import 'package:careno/Host/Views/Screens/screen_host_documents.dart';
import 'package:careno/Host/Views/Screens/screen_host_edit_profile.dart';
import 'package:careno/Host/Views/Screens/screen_host_setting.dart';
import 'package:careno/Host/Views/Screens/screen_host_vehicle.dart';
import 'package:careno/constant/firebase_utils.dart';
import 'package:careno/constant/helpers.dart';
import 'package:careno/controllers/controller_host_home.dart';
import 'package:careno/controllers/home_controller.dart';
import 'package:careno/widgets/custom_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../constant/colors.dart';
import '../../../controllers/booking_controller.dart';
import '../../../controllers/controller_edit_profile.dart';
import '../../../controllers/controller_filter.dart';
import '../../../controllers/controller_update_profile.dart';
import '../../../widgets/custom_button.dart';

class LayoutHostProfile extends StatelessWidget {
  ControllerHostHome controller = Get.put(ControllerHostHome());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          color: AppColors.appPrimaryColor,
          child: Stack(
            children: [
              Positioned(
                  top: 150.h,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.elliptical(350, 170))),
                  )),
              Positioned(
                top: 30.h,
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "My Profile",
                      style: TextStyle(
                          fontSize: 23.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ).marginOnly(bottom: 20.h),
                    Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Obx(() {
                        return GestureDetector(
                          onTap: (){
                            showPopupImage(context, controller.user.value!.imageUrl);
                          },
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            backgroundImage:
                            NetworkImage(controller.user.value == null
                                ? image_url
                                : controller.user.value!.imageUrl),
                          ),
                        );
                      }),
                    ),
                    Obx(() {
                      return Text(
                        controller.user.value == null ? "No User" : controller
                            .user.value!.name,
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w700),
                      );
                    }),
                    Obx(() {
                      return Text(
                        controller.user.value == null ? "No Email" : controller
                            .user.value!.email,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(.5)),
                      );
                    }),
                    Container(
                      width: Get.width,
                      height: 35.h,
                      padding: EdgeInsets.symmetric(horizontal: 18.w),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: Color(0xFFF0F0F0)
                      ),
                      child: Text("Preferences", style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700
                      ),),
                    ).marginOnly(top: 30.h, bottom: 10.h),
                    ListTile(
                      onTap: () {
                        Get.to(ScreenHostEditProfile(userType: 'host',));
                      },
                      leading: Container(
                        height: 36.h,
                        width: 36.w,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(8.r)
                        ),
                        child: CustomSvg(
                          name: "edit-profile",
                        ),

                      ),
                      title: Text("Edit Account", style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15.sp
                      ),),
                      trailing: CustomSvg(name: "arrow-forward",),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(ScreenHostVehicle());
                      },
                      leading: Container(
                        height: 36.h,
                        width: 36.w,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(8.r)
                        ),
                        child: CustomSvg(
                          name: "my-vechile",
                        ),

                      ),
                      title: Text("My Vehicles", style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15.sp
                      ),),
                      trailing: CustomSvg(name: "arrow-forward",),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(ScreenHostDocuments());
                      },
                      leading: Container(
                        height: 36.h,
                        width: 36.w,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(8.r)
                        ),
                        child: CustomSvg(
                          name: "documents",
                        ),

                      ),
                      title: Text("My Documents", style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15.sp
                      ),),
                      trailing: CustomSvg(name: "arrow-forward",),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(ScreenHostSetting());
                      },
                      leading: Container(
                        height: 36.h,
                        width: 36.w,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(8.r)
                        ),
                        child: CustomSvg(
                          name: "setting",
                        ),

                      ),
                      title: Text("Settings", style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15.sp
                      ),),
                      trailing: CustomSvg(name: "arrow-forward",),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(ScreenHostBlockedUser());
                      },
                      leading: Container(
                        height: 36.h,
                        width: 36.w,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(8.r)
                        ),
                        child: CustomSvg(
                          name: "block",
                        ),

                      ),
                      title: Text("Blocked Users", style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15.sp
                      ),),
                      trailing: CustomSvg(name: "arrow-forward",),
                    ),
                    ListTile(
                      onTap: ()async {
                        // await   deleteDirectory("Careno/Users/ProfileImages/feDaYRVnOxcgCFAN4i2Yq41G1Wt1");
                     await   deleteFolder("Host/addVehicle/feDaYRVnOxcgCFAN4i2Yq41G1Wt1/");
                      },
                      leading: Container(
                        height: 36.h,
                        width: 36.w,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(8.r)
                        ),
                        child: CustomSvg(
                          name: "block",
                        ),

                      ),
                      title: Text("Delete My Account  ", style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15.sp
                      ),),
                      trailing: CustomSvg(name: "arrow-forward",),
                    ),
                    ListTile(
                      onTap: () {
                        Get.defaultDialog(
                            title: '',
                            content: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                    padding: EdgeInsets.all(12.sp),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 12.sp),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF0F0F0),
                                        shape: BoxShape.circle
                                    ),
                                    child: Icon(
                                      Icons.clear, color: Colors.black,)),
                              ),
                            ),
                            actions: [
                              Column(
                                children: [
                                  Container(
                                    height: 55.h,
                                    width: 55.w,
                                    padding: EdgeInsets.all(12.sp),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF0F0F0),
                                        borderRadius: BorderRadius.circular(
                                            20.r)),
                                    child: CustomSvg(
                                      name: "logout2",
                                      color: primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.sp,
                                  ),
                                  Text(
                                    "Logout",
                                    style: TextStyle(color: Colors.black,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "UrbanistBold",),
                                  ),
                                  SizedBox(
                                    height: 13.sp,
                                  ),
                                  SizedBox(
                                    height: 36.h,
                                    width: 230.w,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Are you sure you want to Logout Account?",
                                      style: TextStyle(color: Colors.black,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "UrbanistBold",),
                                    ),
                                  ),
                                  CustomButton(
                                      width: 193.w,
                                      title: "Yes, logout",
                                      onPressed: () {

                                          GoogleSignIn().signOut().then((value) {
                                            FirebaseAuth.instance.signOut().then((value) {
                                              Get.offAll(ScreenLogin());

                                              controller.dispose();
                                              Get.find<ControllerFilter>().dispose();
                                              Get.find<BookingController>().dispose();
                                              Get.find<ControllerEditProfile>().dispose();
                                              Get.find<ControllerUpdateProfile>().dispose();
                                              Get.find<ControllerHostHome>().dispose();
                                              log( FirebaseAuth.instance.currentUser!.uid);
                                              log(FirebaseUtils.myId);

                                            });

                                        });
                                          FirebaseAuth.instance.signOut().then((value) {
                                            Get.offAll(ScreenLogin());


                                            controller.dispose();
                                            Get.find<ControllerFilter>().dispose();
                                            Get.find<BookingController>().dispose();
                                            Get.find<ControllerEditProfile>().dispose();
                                            Get.find<ControllerUpdateProfile>().dispose();
                                            Get.find<ControllerHostHome>().dispose();
                                            log( FirebaseAuth.instance.currentUser!.uid);
                                            log(FirebaseUtils.myId);

                                          });
                                      }).marginSymmetric(vertical: 20.h)
                                ],
                              )
                            ]);
                      },
                      leading: Container(
                        height: 36.h,
                        width: 36.w,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(8.r)
                        ),
                        child: CustomSvg(
                          name: "logout",
                        ),

                      ),
                      title: Text("Logout", style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15.sp
                      ),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
