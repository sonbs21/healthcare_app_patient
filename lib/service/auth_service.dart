import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';

class AuthService extends GetxController {
  final _auth = FirebaseAuth.instance;
  var verificationId = "".obs;

  Future<void> signInWithPhoneNumber(String phone) async {
    String phoneNumbers = "+84${phone.substring(1)}";
    print("+====${phoneNumbers}");
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumbers,
      verificationCompleted: (PhoneAuthCredential credential) {
        Get.toNamed(AppRoutes.OTP_PAGE);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          Get.snackbar("Error", "The phone number is not valid");
        } else {
          print("____${e.code}");
          Get.snackbar("Error", "Something went wrong. Try again ${e.code}");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }
}
