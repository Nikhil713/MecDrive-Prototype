import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
      idToken: googleSignInAuthentication.idToken
    ); 

    final user = await _auth.signInWithCredential(credential);
    assert(!user.isAnonymous);
    assert(await user.getIdToken()!=null);

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              padding: EdgeInsets.all(15.0),
              child: Text("Sign in with Google"),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 7.0,
              onPressed: (){
                signInWithGoogle().then((user) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context){
                      return SignInScreen(user);
                    }
                  ));
                });
              }
            )
          ],
        ),
      ),
    );
  }
}