import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

final facebookLogin = FacebookLogin();
final _auth = FirebaseAuth.instance;
Future<Null> signinWithFacebook() async {
  final FacebookLoginResult result = await facebookLogin.logIn(['email']);

  switch (result.status) {
    case FacebookLoginStatus.loggedIn:
      final FacebookAccessToken accessToken = result.accessToken;

      final credential = FacebookAuthProvider.getCredential(
        accessToken: accessToken.token,
      );
      await _auth.signInWithCredential(credential);
      _showMessage('''
         Logged in!  
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
      break;
    case FacebookLoginStatus.cancelledByUser:
      _showMessage('Login cancelled by the user.');
      break;
    case FacebookLoginStatus.error:
      _showMessage('Something went wrong with the login process.\n'
          'Here\'s the error Facebook gave us: ${result.errorMessage}');
      break;
  }
}

void _showMessage(String message) {
  print(message);
}

Future<Null> facebooklogOut() async {
  await facebookLogin.logOut();
  _showMessage('Logged out.');
}
