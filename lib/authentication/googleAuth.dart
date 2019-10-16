import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mec_drive/authentication/signInScreen.dart';

class GoogleAuth extends StatefulWidget {
  @override
  _GoogleAuthState createState() => _GoogleAuthState();
}

class _GoogleAuthState extends State<GoogleAuth> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  //Sign In
  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    final user = await _auth.signInWithCredential(credential);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currUser = await _auth.currentUser();
    assert(user.uid == currUser.uid);

    return user;
  }

  //Sign out
  void signOutGoogle() async {
    await googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Text(
            "Carpool",
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "\"MecDrive is an intiative to promote carpooling in the college. Share your expenses and have a shared experience carpooling\"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Image.asset('assets/gauth.png'),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: GoogleSignInButton(
                  darkMode: true,
                  onPressed: () {
                    signInWithGoogle().then((user) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return SignInScreen(user);
                      }));
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
