import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet {
  static Future<void> uploadPhotoBottomSheet(
    BuildContext context,
    Function(BuildContext, {bool isCamera}) selectImage,
  ) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            10.verticalSpace,
            Center(
              child: Container(
                height: 3.h,
                width: 30.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            20.verticalSpace,
            Text(
              "Choose an action",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            20.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Feedback.forTap(context);
                      Navigator.pop(context);
                      selectImage(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.photo,
                            color: Theme.of(context).colorScheme.primary,
                            size: 50.sp,
                          ),
                          5.verticalSpace,
                          Text(
                            "Gallery",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                20.horizontalSpace,
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Feedback.forTap(context);
                      Navigator.pop(context);
                      selectImage(context, isCamera: true);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera,
                            color: Theme.of(context).colorScheme.primary,
                            size: 50.sp,
                          ),
                          5.verticalSpace,
                          Text(
                            "Camera",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        );
      },
    );
  }

  static Future<void> chooseContactFormatBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            10.verticalSpace,
            Center(
              child: Container(
                height: 3.h,
                width: 30.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            20.verticalSpace,
            Text(
              "Choose a type",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            20.verticalSpace,
            GestureDetector(
              onTap: () {
                Feedback.forTap(context);
                Navigator.pop(context);
                // Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const AddCard()));
              },
              child: Container(
                height: 60.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.credit_card_rounded,
                      color: Theme.of(context).colorScheme.surface,
                      size: 25.sp,
                    ),
                    10.horizontalSpace,
                    Text(
                      "Bizcards",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.surface,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            20.verticalSpace,
            GestureDetector(
              onTap: () {
                Feedback.forTap(context);
                Navigator.pop(context);
                // Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const AddCard()));
              },
              child: Container(
                height: 60.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit_rounded,
                      color: Theme.of(context).colorScheme.surface,
                      size: 25.sp,
                    ),
                    10.horizontalSpace,
                    Text(
                      "Jottings",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.surface,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            20.verticalSpace,
            GestureDetector(
              onTap: () {
                Feedback.forTap(context);
                Navigator.pop(context);
                // Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const AddCard()));
              },
              child: Container(
                height: 60.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone_android_rounded,
                      color: Theme.of(context).colorScheme.surface,
                      size: 25.sp,
                    ),
                    10.horizontalSpace,
                    Text(
                      "Screenshots",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.surface,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            50.verticalSpace,
          ],
        );
      },
    );
  }
}
