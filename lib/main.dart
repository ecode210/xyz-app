import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xyz_app/firebase_options.dart';
import 'package:xyz_app/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.blue,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

// final GoogleSignIn googleSignIn = GoogleSignIn(
// clientId: "1089256537196-tj9ebf2tce5rr0sndnhirvic9cdg9rb9.apps.googleusercontent.com",
// scopes: ["email", "https://www.googleapis.com/auth/calendar"],
// );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return MaterialApp(
          title: "XYZ Everything App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: false,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
            ),
            textTheme: TextTheme(
              displayLarge: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.shadow,
                  fontSize: 45.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              displayMedium: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.shadow,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              displaySmall: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.shadow,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              headlineLarge: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.shadow,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              headlineMedium: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.shadow,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              headlineSmall: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.shadow,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              bodyLarge: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.shadow,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              bodyMedium: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.shadow,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              bodySmall: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.shadow,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              titleLarge: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.shadow,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              titleMedium: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.shadow,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              titleSmall: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.shadow,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          home: const Home(),
        );
      },
    );
  }
}
