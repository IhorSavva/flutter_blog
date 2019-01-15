import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'package:community_material_icon/community_material_icon.dart';

class FacebookGoogleAuthBlock extends StatelessWidget {
  const FacebookGoogleAuthBlock();

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static final FacebookLogin facebookSignIn = FacebookLogin();

  void initiateFacebookLogin() async {
    final FacebookLoginResult result =
    await facebookSignIn.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
    }
  }

  void initiateGoogleLogin() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    _auth.signInWithGoogle(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
            flex: 1,
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(32.0)),
                onPressed: initiateFacebookLogin,
                textColor: Colors.white,
                color: Color(0xff3b5998),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Icon(CommunityMaterialIcons.facebook),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0),
                          child: Text(
                            'FACEBOOK',
                          ))
                    ]))),
        new Container(
          width: 10.0,
        ),
        Flexible(
            flex: 1,
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(32.0)),
                onPressed: initiateGoogleLogin,
                textColor: Colors.white,
                color: Color(0xffdd4b39),
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Icon(CommunityMaterialIcons.google),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0),
                              child: Text(
                                'GOOGLE',
                              ))
                        ]))))
      ],
    );
  }
}