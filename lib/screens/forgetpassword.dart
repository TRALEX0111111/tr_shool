import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tr_school/widgets/buttonwidget.dart';
import 'package:tr_school/widgets/textfiledwidget.dart';
import 'package:tr_school/widgets/textwidget.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  static const routeName = 'FPassword';

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              "Login",
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Rest Passowrd",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidgets(
                    text: "Enter your Email and check you inbox ",
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontsize: 15.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFieldWidgets(
                hintText: "Email",
                controller: emailcontroller,
                obscureText: false,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    12,
                  ),
                ),
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'email is requireq';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                    ),
                    child: ButtonWidgets(
                      text: "Send",
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      width: size.width / 5,
                      hiegth: size.height * 0.05,
                      ontap: () {},
                      bgcolor: const Color.fromARGB(255, 10, 33, 51),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontsize: 18.sp,
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
