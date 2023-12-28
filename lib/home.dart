// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xyz_app/take_photo.dart';
import 'package:xyz_app/utils/custom_bottom_sheet.dart';
import 'package:xyz_app/view_photos.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "XYZ Everything App",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              TextSpan(
                text: "(™) v1.1",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.all(20.w),
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          height: 150.h,
                          width: 388.w,
                        ),
                        Positioned(
                          top: 0,
                          child: SvgPicture.asset(
                            "assets/svg/welcome.svg",
                            height: 250.w,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                    cardTile(
                      context,
                      onTap: () {
                        Feedback.forTap(context);
                        Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const TakePhoto()));
                      },
                      title: "Take Photo",
                      icon: Icons.photo_camera_back_outlined,
                    ),
                    10.verticalSpace,
                    cardTile(
                      context,
                      onTap: () {
                        Feedback.forTap(context);
                        Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const ViewPhotos()));
                      },
                      title: "View Contacts",
                      icon: Icons.image_rounded,
                    ),
                    10.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        googleLogin();
                      },
                      child: Container(
                        height: 60.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(100.r),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.primary.withOpacity(0.25),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 5.h),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Google Sign-In",
                              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.surface,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    20.verticalSpace,
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "World’s simplest, fastest mobile CRM(™)\n",
                              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                    color: Theme.of(context).colorScheme.onSurface,
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                            TextSpan(
                              text: "Call or Text us:\n",
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                            TextSpan(
                              text: "Cal Tiger, chief everything officer, ",
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                            TextSpan(
                              text: "727-565-7296\n",
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  CustomBottomSheet.contactBottomSheet(
                                    context,
                                    number: "17275657296",
                                    launchURL: launchURL,
                                  );
                                },
                            ),
                            TextSpan(
                              text: "JP, PM, India, Whatsapp ",
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                            TextSpan(
                              text: "+91 96556 10954",
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  CustomBottomSheet.contactBottomSheet(
                                    context,
                                    number: "919655610954",
                                    launchURL: launchURL,
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    5.verticalSpace,
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Feedback.forTap(context);
                          launchURL("https://sites.google.com/view/xyzlabs/home");
                        },
                        child: Text(
                          "www.xyzapp.site",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w900,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.surface,
                          radius: 20.r,
                          child: Icon(
                            Icons.beenhere_rounded,
                            color: Theme.of(context).colorScheme.primary,
                            size: 25.sp,
                          ),
                        ),
                        5.verticalSpace,
                        Text(
                          "TRY",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Theme.of(context).colorScheme.surface,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ],
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.surface,
                          radius: 20.r,
                          child: Icon(
                            Icons.question_answer_rounded,
                            color: Theme.of(context).colorScheme.primary,
                            size: 25.sp,
                          ),
                        ),
                        5.verticalSpace,
                        Text(
                          "FAQ",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Theme.of(context).colorScheme.surface,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ],
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.surface,
                          radius: 20.r,
                          child: Icon(
                            Icons.settings_rounded,
                            color: Theme.of(context).colorScheme.primary,
                            size: 30.sp,
                          ),
                        ),
                        5.verticalSpace,
                        Text(
                          "SETTINGS",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Theme.of(context).colorScheme.surface,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardTile(
    BuildContext context, {
    required void Function()? onTap,
    required String title,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150.h,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(100.r),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.25),
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 5.h),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.surface,
              size: 40.sp,
            ),
            5.horizontalSpace,
            Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> googleLogin() async {
    final user = await googleSignIn.signIn();
    if (user == null) return;
    final auth = await user.authentication;
    print("Access Token: ${auth.accessToken}");
    print("Email: ${user.email}");
    print("Photo: ${user.photoUrl}");
    print("Name: ${user.displayName}");
  }

  Future<void> launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      debugPrint("Could not launch $url");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Could not launch URL")));
    }
  }
}
