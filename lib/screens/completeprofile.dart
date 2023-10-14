import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:tr_school/helper/imagehelper.dart';
import 'package:tr_school/screens/profilescreen.dart';
import 'package:tr_school/widgets/buttonwidget.dart';
import 'package:tr_school/widgets/textfiledwidget.dart';
import 'package:tr_school/widgets/textwidget.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({
    super.key,
  });

  static const routeName = 'CProfile';

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final usernamecontroller = TextEditingController();
  final birthdaycontroller = TextEditingController();
  final imageHelper = ImageHelper();
  File? image;
  DateTime date = DateTime.now();
  late File profilePicture;

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage == null) {
      return;
    }

    setState(() {
      profilePicture = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            10,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      "assets/jsons/cprofile.json",
                      width: 120.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextWidgets(
                  text: "Enter you information !",
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontsize: 16.sp,
                ),
                SizedBox(
                  height: 15.h,
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 45,
                  foregroundImage: image != null ? FileImage(image!) : null,
                  child: const Text(
                    "tzamar",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                TextButton(
                  onPressed: _pickImage,
                  child: const Text("Select Photo"),
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFieldWidgets(
                  hintText: "Username",
                  controller: usernamecontroller,
                  obscureText: false,
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  validator: (username) {
                    if (username!.isEmpty) {
                      return 'Username is required.';
                    } else if (username.length < 6) {
                      return 'Username must be at least 6 characters long.';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.name,
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    20,
                  ),
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.datetime,
                    obscureText: false,
                    validator: (value) {
                      return null;
                    },
                    controller: birthdaycontroller,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            12,
                          ),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            12,
                          ),
                        ),
                      ),
                      fillColor: const Color.fromARGB(255, 155, 152, 152),
                      filled: true,
                      hintText: '${date.day}/${date.month}/${date.year}',
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15.sp,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2024),
                          );
                          if (newDate == null) return;
                          setState(() {
                            date = newDate;
                          });
                        },
                        icon: const Icon(
                          Icons.calendar_today,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ButtonWidgets(
                  text: "Next",
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  width: size.width / 1.2,
                  hiegth: size.height * 0.06,
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  ProfileScreen(
                          profilePictureUrl: profilePictureUrl,
                        ),
                      ),
                    );
                  },
                  bgcolor: const Color.fromARGB(255, 12, 37, 58),
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontsize: 15.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
onPressed: () async {
                    final file = await imageHelper.pickImage();
                    if (file.isNotEmpty) {
                      // ignore: non_constant_identifier_names
                      final CroppedFile = await imageHelper.crop(
                        file: file.first,
                        cropStyle: CropStyle.circle,
                      );
                      if (CroppedFile != null) {
                        setState(() {
                          image = File(CroppedFile.path);
                        });
                      }
                    }
                  }, */