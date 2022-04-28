import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:rawr/controllers/client/client_controller.dart';
import 'package:rawr/helpers/lulz_imports.dart';

class AuthenticationController extends GetxController {
  /// [appwrite]
  static final Client _client = Get.find<ClientController>().getClient;
  final Account _account = Account(_client);

  /// string constants
  static const String _className = 'AuthenticationController';

  //
  // ─── STATE MANAGEMENT ───────────────────────────────────────────────────────────
  //
  late LulzUser _userData;
  set userEmail(String email) => _userData.email = email;
  set userPassword(String password) => _userData.password = password;
  set userUsername(String username) => _userData.username = username;

  /// It is recommended you use the methods [navigateTo] or [navigateOffTo]
  ///  when navigating to other screens to make sure you reset user data.
  void resetUserdata() => _userData = LulzUser();
  //
  // ───────────────────────────────────────────────────────── STATE MANAGEMENT ─────
  //

  //
  // ─── SIGN UP WITH EMAIL AND PASSOWRD ────────────────────────────────────────────
  //
  void signUpWithEmailAndPassword() async {
    try {
      await _account.create(
        userId: 'unique()',
        email: _userData.email!,
        password: _userData.password!,
        name: _userData.username,
      );
    } catch (e) {
      LulzUtils.handleError(
          toastMessage: 'error signing up',
          error: e.toString(),
          className: _className);
    }
  }
  //
  // ────────────────────────────────────────── SIGN UP WITH EMAIL AND PASSOWRD ─────
  //

  //
  // ─── SIGN IN WITH EMAIL AND PASSWORD ────────────────────────────────────────────
  //
  void signInWithEmailAndPassword() {
    try {
      _account.createSession(
        email: 'account@account.account',
        password: 'account@account.account',
      );
         Get.showSnackbar(const GetSnackBar(
        title: '',
        message: 'signed in',
      ));
    } catch (e) {
      LulzUtils.handleError(
          toastMessage: 'error signing in',
          error: e.toString(),
          className: _className);
    }
  }
  //
  // ────────────────────────────────────────── SIGN IN WITH EMAIL AND PASSWORD ─────
  //

  //
  // ─── SIGN OUT ───────────────────────────────────────────────────────────────────
  //
  void signOut() async {
    try {
      await _account.deleteSessions();
    } catch (e) {
      LulzUtils.handleError(
          toastMessage: 'error signing out',
          error: e.toString(),
          className: _className);
    }
  }
  //
  // ───────────────────────────────────────────────────────────────── SIGN OUT ─────
  //

}
