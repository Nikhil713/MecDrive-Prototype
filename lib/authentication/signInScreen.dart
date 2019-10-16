import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInScreen extends StatelessWidget {

  final user;
  SignInScreen(this.user);
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signed In"),
        centerTitle: true,
      ),    
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              child: Image(
                image: CachedNetworkImageProvider(user.photoUrl),
              ),
            ),
            Text((user.displayName).toString()),
            Text((user.email).toString()),
            // Text((user.phoneNumber).toString()),
            SizedBox(height: 10),
            RaisedButton(
              child: Text("SignOut"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () async {
                await googleSignIn.signOut().then((e){
                  Navigator.of(context).pop();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}