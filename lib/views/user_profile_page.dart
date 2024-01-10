import 'package:flutter/material.dart';
import 'package:mySHOP/views/auth/login_page.dart';
import 'package:mySHOP/service/apiServices.dart';
import 'package:mySHOP/service/auth_service.dart';
import 'package:mySHOP/componants/bottom_navigation_bar.dart';
import 'package:mySHOP/views/test_show_product.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('profile'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: const Text('Api call'),
            onPressed: () async{

              
            
          // await ApiService.fetchProducts();
            Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => TestShowProducts()),
            // MaterialPageRoute(builder: (context) => ExampleOne()),
             );
            },
          ),
          ListTile(
            onTap: () async {
              showDialog(
                  //  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Logout"),
                      content: const Text("Are you sure you want to logout?"),
                      actions: [
                        Container(
                            child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                        Container(
                            child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text('Ok'),
                          onPressed: () async {
                            await authService.signOut();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                                (route) => false);
                          },
                        )),
                      ],
                    );
                  });
              // authService.signOut().whenComplete(() {
              //   nextScreenReplace(context, const LoginPage());
              // });
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout", style: TextStyle(color: Colors.black)),
          ),
          const Text('profile'),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
