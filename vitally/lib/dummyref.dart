import 'package:flutter/material.dart';
import 'package:vitally/pagetransition.dart';
import 'finalOnboarding.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DummyPage extends StatefulWidget {
  @override
  _DummyPageState createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  final _auth = FirebaseAuth.instance;

  final _googleSignIn = GoogleSignIn();

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInwithGoogle Succeded: $user';
  }

  void singOutGoogle() async {
    await _googleSignIn.signOut();
    print('user Sign Out');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'DummyPage',
        ),
      ),
      body: MaterialButton(
        child: Text('Logout'),
        onPressed: () {
          setState(() {
            try {
              _auth.signOut();
            } catch (e) {
              try {
                _googleSignIn.signOut();
              } catch (e) {
                print(e);
                print('signed out successfully');
              }
              print(e);
              print('signed out successfully');
            }
          });
          Navigator.push(context, ScaleRoute(page: UserLoginPage()));
        },
      ),
    );
  }
}
