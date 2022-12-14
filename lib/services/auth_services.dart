part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(
      String email,
      String password,
      String name,
      List<String> selectedGenres,
      String selectedLangluage) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user.convertToUser(
          name: name,
          selectedGenre: selectedGenres,
          selectedLanguage: selectedLangluage);

      // Send to Firestore
      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }
}

// If error, return :

class SignInSignUpResult {
  final User user;
  final String message;

  SignInSignUpResult({this.user, this.message});
}
