import 'package:google_sign_in/google_sign_in.dart';


class AuthService{
  //google sign in


    signInWithGoogle() async {
     final GoogleSignInAccount? googleuser = await  GoogleSignIn().signIn();
    print(googleuser?.email);
     print(googleuser?.id);
     print(googleuser?.displayName);

      final GoogleSignInAuthentication? googleauth = await googleuser?.authentication;
     //  print(googleauth?.accessToken);
     // print(googleauth?.idToken);
      //create credential


  }
}