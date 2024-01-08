import 'package:get/get.dart';
import 'package:t_shirt_world/helper/helper.dart';

class IsSignInController extends GetxController {
  RxBool isSignedIn = false.obs;

  void getUserLoggedInStatus() async {
    await HelperFuctions.getUserLoggedInStatus().then((value) {
      if (value != null) {

        isSignedIn.value = value;
        //print(isSignedIn);
        print(value);
      }
    });
  }
}
