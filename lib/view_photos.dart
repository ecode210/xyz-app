import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xyz_app/models/business_card_model.dart';
import 'package:xyz_app/widgets/photos_list.dart';

class ViewPhotos extends StatelessWidget {
  const ViewPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          "VIEW PHOTOS",
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
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("business_cards").snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Container(
                  padding: EdgeInsets.all(20.w),
                  alignment: Alignment.topCenter,
                  child: CircularProgressIndicator.adaptive(
                    strokeWidth: 5.w,
                    strokeCap: StrokeCap.round,
                  ),
                );
              case ConnectionState.active:
                final data = snapshot.requireData.docs;
                final cards = getBusinessCards(data);
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.all(20.w),
                  separatorBuilder: (_, __) => 10.verticalSpace,
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    return PhotosList(card: cards[index]);
                  },
                );
              case ConnectionState.done:
              case ConnectionState.none:
                return Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Unable to connect to the server",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              // fontWeight: FontWeight.w900,
                            ),
                      ),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }

  List<BusinessCardModel> getBusinessCards(List<QueryDocumentSnapshot<Object?>> data) {
    final List<BusinessCardModel> cards = [];
    try {
      for (final card in data) {
        final rawData = card.data() as Map<String, dynamic>;
        cards.add(BusinessCardModel.fromJson(rawData));
      }
    } catch (e) {
      debugPrint('Error parsing cards: $e');
    }
    return cards;
  }
}
