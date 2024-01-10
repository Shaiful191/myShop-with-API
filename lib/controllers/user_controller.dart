// import 'package:get/get.dart';
// import 'package:t_shirt_world/helper/helper.dart';
// import 'package:t_shirt_world/service/auth_service.dart';

// class UserController extends GetxController{
//  RxString userName = "".obs;
//   RxString email = "".obs;

//   AuthService authService = AuthService();
 

  
  

//   //string manipulation
//   // String getId(String res) {
//   //   return res.substring(0, res.indexOf("_"));
//   // }

//   String getName(String res) {
//     return res.substring(res.indexOf("_") + 1);
//   }

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     gettingUserData();
//   }


//   gettingUserData() async {
//     await HelperFuctions.getUserEmailFormSF().then((value) {
//       setState(() {
//         email = value!;
//       });
//     });
//     await HelperFuctions.getUserNameFormSF().then((value) {
//       setState(() {
//         userName = value!;
//       });
//     });

//     //getting the list of snapshots in our stream
//     await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
//         .getUserGroups()
//         .then((snapshot) {
//       setState(() {
//         groups = snapshot;
//       });
//     });
//   }

// }