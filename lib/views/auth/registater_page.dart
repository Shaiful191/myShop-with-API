import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:t_shirt_world/utils/app_color.dart';
import 'package:t_shirt_world/helper/helper.dart';
import 'package:t_shirt_world/views/auth/login_page.dart';
import 'package:t_shirt_world/views/home_page.dart';
import 'package:t_shirt_world/service/auth_service.dart';
import 'package:t_shirt_world/utils/constants.dart';
import 'package:t_shirt_world/componants/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";

  bool _isLoading = false;
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          :
          //   MediaQuery.removePadding(
          // context: context,
          // removeTop: true,

          SingleChildScrollView(
              // child: Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80),
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
                                          "assets/t_shirt_world_logo.jpg"),
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
                        //   'T-Shirt World',
                        //   style: TextStyle(
                        //       fontSize: 40, fontWeight: FontWeight.bold),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),

                        const Text(
                          'Create your account now to buy t-shirt',
                          style: TextStyle(
                              color: AppColors.secondary,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Image.asset("assets/chat_app_login.jpg"),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: TextFormField(
                            decoration: textInputDecoration.copyWith(
                                labelText: "Full Name",
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Theme.of(context).primaryColor,
                                )),
                            onChanged: (val) {
                              setState(() {
                                fullName = val;
                              });
                            },
                            validator: (val) {
                              if (val!.isNotEmpty) {
                                return null;
                              } else {
                                return "Name cannot be empty";
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: TextFormField(
                            decoration: textInputDecoration.copyWith(
                                labelText: "Email",
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Theme.of(context).primaryColor,
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
                                  register();
                                },
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text.rich(TextSpan(
                            text: "Already have an account? ",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                            children: [
                              TextSpan(
                                  text: "Login Now",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                      fontSize: 14),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      nextScreen(context, const LoginPage());
                                    })
                            ])),
                      ],
                    ),
                  )),
            ),
      //  ),
      // ),
    );
  }

  void register() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await authService
          .registerUserWithEmailAndPassword(fullName, email, password)
          .then((value) async {
        if (value == true) {
          //saving the shared-preference state
          await HelperFuctions.saveUserLoggedInStatus(true);
          await HelperFuctions.saveUserEmailSF(email);
          await HelperFuctions.saveUserNameSF(fullName);
          showSnackbar(
              context, Colors.green, "Registration completed successfully");
          nextScreenReplace(context, const LoginPage());
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

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
