import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tr_school/widgets/textwidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 36, 53),
        title: TextWidgets(
          text: "Tr-School",
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontsize: 17.sp,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "Chat");
          },
          icon: const Icon(
            Icons.chat,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width / 1.1,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.green[900],
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                    child: Center(
                      child: TextWidgets(
                        text: "الإبتدائي ",
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontsize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width / 1.1,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.green[900],
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                    child: Center(
                      child: TextWidgets(
                        text: "الإعدادي ",
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontsize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width / 1.1,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.green[900],
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                    child: Center(
                      child: TextWidgets(
                        text: "الثانوي",
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontsize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
