import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mySHOP/utils/app_color.dart';
import 'package:mySHOP/controllers/signInStatus_controller.dart';
import 'package:mySHOP/utils/constants.dart';
import 'package:mySHOP/utils/global.dart';
import 'package:mySHOP/utils/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    isSignInController.getUserLoggedInStatus();
  }

  final IsSignInController isSignInController = Get.put(IsSignInController());
  //bool k = isSignInController.isSignedIn as bool;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoutes,
      // routes: {
       
      //   '/': (context) => Obx(() {
      //       return isSignInController.isSignedIn == true
      //           ? const HomePage()
      //           : const LoginPage();
      //     }),
       
      //   '/search': (context) => const SearchPage(),
      // },
    );
  }
}
