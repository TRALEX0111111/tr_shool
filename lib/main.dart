import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tr_school/screens/chatscreen.dart';
import 'package:tr_school/screens/completeprofile.dart';
import 'package:tr_school/screens/forgetpassword.dart';
import 'package:tr_school/screens/homescreen.dart';
import 'package:tr_school/screens/loginscreen.dart';
import 'package:tr_school/screens/registerscreen.dart';
import 'package:tr_school/screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure you want to exit?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () =>
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      },
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          // Use builder only if you need to use library outside ScreenUtilInit context
          builder: (_, child) {
            return MaterialApp(
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              title: 'Tr-School',
              initialRoute: "CProfile",
              routes: {
                "Splash": (context) => const SplashScreen(),
                "Login": (context) => const LoginScreen(),
                "Register": (context) => const RegisterScreen(),
                "FPassword": (context) => const ForgetPassword(),
                "CProfile": (context) => const CompleteProfile(),
                "Chat": (context) => const ChatScreen(),
                "Home": (context) => const HomeScreen(),
               
              },
            );
          }),
    );
  }
}
