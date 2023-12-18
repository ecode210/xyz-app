import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xyz_app/add_card.dart';

class TakePhoto extends StatelessWidget {
  const TakePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Take Photo",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.surface,
                fontWeight: FontWeight.w900,
              ),
        ),
        leading: BackButton(
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            30.verticalSpace,
            cardTile(
              context,
              title: "Bizcards",
              icon: Icons.credit_card_rounded,
            ),
            30.verticalSpace,
            cardTile(
              context,
              title: "Jottings",
              icon: Icons.edit_rounded,
            ),
            30.verticalSpace,
            cardTile(
              context,
              title: "Screenshots",
              icon: Icons.phone_android_rounded,
            ),
          ],
        ),
      ),
    );
  }

  Widget cardTile(
    BuildContext context, {
    required String title,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: () {
        Feedback.forTap(context);
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) => AddCard(type: title.toUpperCase())));
      },
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
}
