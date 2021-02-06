
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleSignInService{

  GoogleSignInService._init();
  static final GoogleSignInService _instance = GoogleSignInService._init();
  factory GoogleSignInService() => _instance;

  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email',],
  );

  Future<String> loginGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      final key = await account.authentication;

      final signInWithGoogle = Uri(
        scheme: 'https',
        host: 'auth-google-apple.herokuapp.com',
        path: '/google'
      );

      final session = await http.post(
        signInWithGoogle,
        body: {
          'token': key.idToken
        }
      );

      return session.body;
      
    } catch (e) {
      print('error de login: $e');
      return null;
    }
  }

  Future logoutGoogle() async{
    await _googleSignIn.signOut();
  }
}