import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/resources/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyApp extends StatefulWidget {
  // named constructor
  const MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;

    return MaterialApp(
      builder: EasyLoading.init(),
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      debugShowCheckedModeBanner: false,
      initialRoute:
          supabase.auth.currentUser == null
              ? AppRoutes.splashRoute
              : AppRoutes.mainRoute,
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
