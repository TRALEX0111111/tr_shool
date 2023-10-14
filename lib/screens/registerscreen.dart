import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:tr_school/widgets/buttonwidget.dart';
import 'package:tr_school/widgets/textbuttonwidget.dart';
import 'package:tr_school/widgets/textfiledwidget.dart';
import 'package:tr_school/widgets/textwidget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const routeName = 'Register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final cpasswordcontroller = TextEditingController();
  bool obscuretext = true;
  bool cobscuretext = true;
  void onRegisterPressed() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration successful.'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email, password, or confirm password.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Form(
        key: formKey,
        child: SafeArea(
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
                        "assets/jsons/regisrer.json",
                        width: 120.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidgets(
                        text: "Let's creat yout account !",
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontsize: 16.sp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
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
                        return 'Email is requireq';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(email)) {
                        return 'Please enter a valid email address.';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFieldWidgets(
                    hintText: "Password",
                    controller: passwordcontroller,
                    obscureText: obscuretext,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        12,
                      ),
                    ),
                    validator: (password) {
                      if (password!.isEmpty) {
                        return 'Password is required.';
                      } else if (password.length < 6) {
                        return 'Password must be at least 6 characters long.';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    onpressed: () {
                      setState(() {
                        obscuretext = !obscuretext;
                      });
                    },
                    iconButton:
                        obscuretext ? Icons.visibility : Icons.visibility_off,
                  ),
                  TextFieldWidgets(
                    hintText: "Confirm Password",
                    controller: passwordcontroller,
                    obscureText: cobscuretext,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        12,
                      ),
                    ),
                    validator: (cpassword) {
                      if (cpassword!.isEmpty) {
                        return 'Password is required.';
                      } else if (cpassword != passwordcontroller.text) {
                        return 'Passwords must match.';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    onpressed: () {
                      setState(() {
                        cobscuretext = !cobscuretext;
                      });
                    },
                    iconButton:
                        cobscuretext ? Icons.visibility : Icons.visibility_off,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ButtonWidgets(
                    text: "Sing Un",
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        12,
                      ),
                    ),
                    width: size.width / 1.2,
                    hiegth: size.height * 0.06,
                    ontap: onRegisterPressed,
                    bgcolor: const Color.fromARGB(255, 8, 30, 48),
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontsize: 18.sp,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                        ),
                        child: TextWidgets(
                          text: "Or continue with",
                          fontWeight: FontWeight.normal,
                          fontsize: 14.sp,
                          color: Colors.black,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.blueAccent,
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
                      IconButton(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          size: 30.sp,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.facebook,
                          size: 30.sp,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.apple,
                          size: 30.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidgets(
                        text: "Already have an account ?",
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontsize: 15.sp,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      TextButtonWidget(
                        text: "Login now",
                        ontap: () {
                          Navigator.pushNamed(context, "Login");
                        },
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontsize: 16.sp,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
