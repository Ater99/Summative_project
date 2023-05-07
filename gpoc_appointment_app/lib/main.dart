import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpoc_appointment_app/locator.dart';
import 'package:gpoc_appointment_app/ui/views/auth_view.dart';
import 'package:gpoc_appointment_app/ui/views/input_form_view.dart';
import 'package:gpoc_appointment_app/ui/views/landing_view.dart';
import 'package:gpoc_appointment_app/ui/views/startup_view.dart';

void main() async {
  document.documentElement?.lang = 'en';
  // await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GPOc Appointment App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => StartUpView()),
        GetPage(
          name: '/login',
          page: () => const AuthView('Log in', 'Sign Up'),
        ),
        GetPage(
          name: '/signup',
          page: () => const AuthView('Sign Up', 'Log In'),
        ),
        GetPage(name: '/form', page: () => InputFormView()),
        GetPage(name: '/landing', page: () => LandingView()),
      ],
      home: StartUpView(),
    );
  }
}
