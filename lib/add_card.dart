// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xyz_app/models/business_card_model.dart';
import 'package:xyz_app/utils/custom_bottom_sheet.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key, required this.type});

  final String type;

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final nameController = TextEditingController();

  final focusNode1 = FocusNode();

  final photoController = TextEditingController();

  var selectedFile = "";

  final focusNode2 = FocusNode();

  final notesController = TextEditingController();

  final focusNode3 = FocusNode();

  var enabled = false;

  var loading = false;

  @override
  void initState() {
    nameController.clear();
    photoController.clear();
    notesController.clear();
    enabled = false;
    loading = false;
    selectedFile = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "ADD ${widget.type}",
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 150.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Full Name",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                    TextFieldTapRegion(
                      child: TextField(
                        controller: nameController,
                        focusNode: focusNode1,
                        onTapOutside: (_) => focusNode1.unfocus(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          labelText: "Enter full name",
                          contentPadding: EdgeInsets.all(10.w),
                        ),
                        onChanged: (value) {
                          setState(() {
                            if (nameController.text.trim().isNotEmpty &&
                                selectedFile.trim().isNotEmpty &&
                                notesController.text.trim().isNotEmpty) {
                              enabled = true;
                            } else {
                              enabled = false;
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 250.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Take Photo",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                        Icon(
                          Icons.upload_file_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          await CustomBottomSheet.uploadPhotoBottomSheet(context, selectImage);
                          setState(() {
                            if (nameController.text.trim().isNotEmpty &&
                                selectedFile.trim().isNotEmpty &&
                                notesController.text.trim().isNotEmpty) {
                              enabled = true;
                            } else {
                              enabled = false;
                            }
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10.r),
                            image: selectedFile.isNotEmpty
                                ? DecorationImage(
                                    image: FileImage(File(selectedFile)),
                                    alignment: Alignment.center,
                                    fit: BoxFit.cover,
                                    opacity: 0.75,
                                  )
                                : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.photo_camera_back_outlined,
                                color: Theme.of(context).colorScheme.surface,
                                size: 30.sp,
                              ),
                              5.verticalSpace,
                              Text(
                                "Click to take photo",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: Theme.of(context).colorScheme.surface,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 150.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Notes",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                    TextFieldTapRegion(
                      child: TextField(
                        controller: notesController,
                        focusNode: focusNode3,
                        onTapOutside: (_) => focusNode3.unfocus(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          labelText: "Enter notes",
                          contentPadding: EdgeInsets.all(10.w),
                        ),
                        onChanged: (value) {
                          setState(() {
                            if (nameController.text.trim().isNotEmpty &&
                                selectedFile.trim().isNotEmpty &&
                                notesController.text.trim().isNotEmpty) {
                              enabled = true;
                            } else {
                              enabled = false;
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              FilledButton(
                onPressed: enabled ? () => addCard() : null,
                style: FilledButton.styleFrom(
                  enableFeedback: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBackgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.25),
                ),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: loading
                      ? CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.surface,
                          strokeWidth: 3,
                        )
                      : Text(
                          "Add",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: Theme.of(context).colorScheme.surface,
                              ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectImage(BuildContext context, {bool isCamera = false}) async {
    final imagePicker = ImagePicker();
    final selectedImage = await imagePicker.pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not upload file')));
      return;
    }
    setState(() {
      final name = selectedImage.name.split("_");
      selectedFile = selectedImage.path;
      photoController.text = name.last.split("-").last;
      if (nameController.text.trim().isNotEmpty &&
          selectedFile.trim().isNotEmpty &&
          notesController.text.trim().isNotEmpty) {
        enabled = true;
      } else {
        enabled = false;
      }
    });
  }

  Future<String?> uploadFile(File file) async {
    String? link;
    try {
      final storage = FirebaseStorage.instance;
      final ref =
          storage.ref().child('business_card/${DateTime.now().millisecondsSinceEpoch}-${photoController.text.trim()}');
      await ref.putFile(file);
      link = await ref.getDownloadURL();
      link = link.replaceAll("business_card/", "business_card%2F");
      print(Uri.parse(link));
    } catch (e) {
      debugPrint('Error uploading photo: $e');
    }
    return link;
  }

  Future<void> addCard() async {
    setState(() {
      loading = true;
    });

    final link = await uploadFile(File(selectedFile));
    if (link == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not upload photo')));
      setState(() {
        loading = false;
      });
      return;
    }

    final firestore = FirebaseFirestore.instance;
    final businessCardCollection = firestore.collection("business_cards");

    try {
      final results = await businessCardCollection.add(BusinessCardModel(
        fullName: nameController.text.trim(),
        photo: link,
        notes: notesController.text.trim(),
      ).toJson());
      await businessCardCollection.doc(results.id).update(BusinessCardModel(
            id: results.id,
            timestamp: DateTime.now().millisecondsSinceEpoch,
          ).toJson());
      debugPrint('${widget.type} added: $results');
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${widget.type} added')));
    } catch (e) {
      debugPrint('Error adding card: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not add ${widget.type.toLowerCase()}')));
    }
    setState(() {
      loading = false;
    });
  }

  Future<void> editCard() async {
    setState(() {
      loading = true;
    });

    String? link;
    if (selectedFile.isNotEmpty) {
      link = await uploadFile(File(selectedFile));
      if (link == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not upload photo')));
        setState(() {
          loading = false;
        });
        return;
      }
    }

    final firestore = FirebaseFirestore.instance;
    final businessCardCollection = firestore.collection("business_cards");

    try {
      await businessCardCollection.doc(/*widget.card!.id*/).update(BusinessCardModel(
            fullName: nameController.text.trim(),
            photo: link,
            notes: notesController.text.trim(),
            timestamp: DateTime.now().millisecondsSinceEpoch,
          ).toJson());
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Card updated')));
    } catch (e) {
      debugPrint('Error updating card: $e');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not update card')));
    }
    setState(() {
      loading = false;
    });
  }

// Future<void> addCard() async {
//   setState(() {
//     loading = true;
//   });
//   final link = await uploadFile(File(selectedFile));
//   if (link == null) {
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not upload file')));
//     setState(() {
//       loading = false;
//     });
//     return;
//   }
//   final time = DateFormat.yMMMMEEEEd().format(DateTime.now());
//
//   try {
//     final dio = Dio();
//     final response = await dio.get(
//       "https://script.google.com/macros/s/AKfycbxfwI-GR6wYqoE8SJWgfM7vI-OahKETEw011YFUvr2WLc-Ib2UWpLjisW55eOA5AnmE/exec?time=$time&name=${nameController.text.trim()}&card=$link&notes=${notesController.text.trim()}",
//     );
//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Card added')));
//     }
//   } catch (e) {
//     debugPrint('Error uploading file: $e');
//   }
//   setState(() {
//     loading = false;
//   });
// }
}
