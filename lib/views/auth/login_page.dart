import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mySHOP/utils/app_color.dart';
import 'package:mySHOP/helper/helper.dart';
import 'package:mySHOP/views/auth/registater_page.dart';
import 'package:mySHOP/views/home_page.dart';
import 'package:mySHOP/service/auth_service.dart';
import 'package:mySHOP/service/database_service.dart';
import 'package:mySHOP/utils/constants.dart';
import 'package:mySHOP/componants/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  bool _isLoading = false;
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor),
            )
          : SingleChildScrollView(
              child: Form(
                  key: formkey,
                  child: Center(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: <Widget>[
                            ClipPath(
                              clipper: WaveClipper2(),
                              child: Container(
                                width: double.infinity,
                                height: 300,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                  Color.fromARGB(31, 58, 255, 68),
                                  Color.fromARGB(31, 121, 254, 73)
                                ])),
                                child: Column(),
                              ),
                            ),
                            ClipPath(
                              clipper: WaveClipper3(),
                              child: Container(
                                width: double.infinity,
                                height: 300,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                  Color.fromARGB(68, 58, 255, 150),
                                  Color.fromARGB(68, 85, 254, 73)
                                ])),
                                child: Column(),
                              ),
                            ),
                            ClipPath(
                              clipper: WaveClipper1(),
                              child: Container(
                                width: double.infinity,
                                height: 300,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                  AppColors.primary,
                                  AppColors.secondary,
                                ])),
                                child: Column(
                                  children: const <Widget>[
                                    SizedBox(
                                      height: 70,
                                    ),
                                    // Icon(
                                    //   Icons.shop,
                                    //   color: Colors.white,
                                    //   size: 60,
                                    // ),

                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          "assets/mySHOP_logo.jpg"),
                                    ),

                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "T-Shirt World",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 30),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        // const Text(
                        //   'Groupie',
                        //   style: TextStyle(
                        //       fontSize: 40, fontWeight: FontWeight.bold),
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Login now to see new t-shirt',
                          style: TextStyle(
                              color: AppColors.secondary,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // Image.asset("assets/chat_app_login.jpg"),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: TextFormField(
                            decoration: textInputDecoration.copyWith(
                                labelText: "Email",
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: AppColors.secondary,
                                )),
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                            validator: (val) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(val!)
                                  ? null
                                  : "Please enter a valid email";
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: textInputDecoration.copyWith(
                                labelText: "Password",
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Theme.of(context).primaryColor,
                                )),
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                            validator: (val) {
                              if (val!.length < 6) {
                                return "Password must be at least 6 characters";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    )),
                                onPressed: () {
                                  login();
                                },
                                child: const Text(
                                  "LogIn",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text.rich(TextSpan(
                            text: "Don't have an account? ",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                            children: [
                              TextSpan(
                                  text: "Register Here",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                      fontSize: 14),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      nextScreen(context, const RegisterPage());
                                    })
                            ])),
                      ],
                    ),
                  )),
            ),
    );
  }

  void login() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await authService
          .loginWithUserEmailAndPassword(email, password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(email);

          //saving the values to our shared preferences
          await HelperFuctions.saveUserLoggedInStatus(true);
          await HelperFuctions.saveUserEmailSF(email);

          await HelperFuctions.saveUserNameSF(snapshot.docs[0]['fullName']);

          // ignore: use_build_context_synchronously
          nextScreenReplace(context, const HomePage());
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
