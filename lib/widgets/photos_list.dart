import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:xyz_app/models/business_card_model.dart';
import 'package:xyz_app/photo_details.dart';

class PhotosList extends StatelessWidget {
  const PhotosList({super.key, required this.card});

  final BusinessCardModel card;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => PhotoDetails(photo: card)));
      },
      child: Container(
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          children: [
            Container(
              height: 100.h,
              width: 100.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1000.r),
                child: Hero(
                  tag: card.id,
                  child: CachedNetworkImage(
                    imageUrl: card.photo,
                    width: 95.h,
                    height: 95.h,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    errorListener: (value) {
                      debugPrint(value.toString());
                    },
                    progressIndicatorBuilder: (context, data, value) {
                      return CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.surface,
                        strokeWidth: 10.w,
                        strokeCap: StrokeCap.round,
                      );
                    },
                  ),
                ),
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    card.fullName,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  5.verticalSpace,
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        color: Theme.of(context).colorScheme.primary,
                        size: 15.sp,
                      ),
                      5.horizontalSpace,
                      Expanded(
                        child: Text(
                          DateFormat("dd MMM yyyy | HH:mm a")
                              .format(DateTime.fromMillisecondsSinceEpoch(card.timestamp.toInt())),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: 15.sp,
            ),
            20.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
