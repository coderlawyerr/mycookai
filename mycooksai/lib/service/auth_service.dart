import 'package:firebase_auth/firebase_auth.dart';
import 'package:mycooksai/model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? _userFromFirebase(User? user) {
    return user != null ? UserModel.fromFirebaseUser(user) : null;
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  Future<UserModel?> getCurrentUser() async {
    return _userFromFirebase(_auth.currentUser);
  }

  Future<void> registerWithEmail(
      String email, String password, String name) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());

      UserModel newUser = UserModel(
          userId: userCredential.user!.uid, name: name, email: email.trim());
    } on FirebaseAuthException catch (e) {
      print(
          "auth servicenın ıcerısındekı regıster with email registerWithEmail fonksıyonunda hata: ${e.toString()}");
    }
  }

  Future<void> loginWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      print(
          "auth servicenın ıcerısındekı login with email loginWithEmail fonksıyonunda hata: ${e.toString()}");
    }
  }
}
