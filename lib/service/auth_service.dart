import 'package:google_sign_in/google_sign_in.dart';


class AuthService{
  //google sign in


  Future<Map<String,String?>>  signInWithGoogle() async {
     final GoogleSignInAccount? googleuser = await  GoogleSignIn().signIn();
    // print(googleuser?.email);

    //  print(googleuser);
    //
    //
    //
    //  print("Photo url is ");
    //  print(googleuser?.photoUrl.toString());
     // print(googleuser?.displayName);



      final GoogleSignInAuthentication? googleauth = await googleuser?.authentication;
     //  print(googleauth?.accessToken);
     // print(googleauth?.idToken);
     // print(googleauth?.idToken);

      //create credential
     var user = {
       "email":googleuser?.email,
       "displayname":googleuser?.displayName,
       "id":googleuser?.id
     };
     return user;

  }
}