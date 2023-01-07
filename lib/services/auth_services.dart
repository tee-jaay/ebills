import 'package:http/http.dart' as http;

class AuthServices {
  Future<String> signUp(String email, String username, String password) async {
    // await func
    print('signUp');
    print(email);
    print(username);
    print(password);
    return 'signUp';
  }

  Future<String> signIn(String email, String password) async {
    // await func
    print('signIn');
    print(email);
    print(password);
    return 'signIn';
  }

  Future<String> signOut() async {
    // await func
    print('signOut');
    return 'sign out';
  }
}
