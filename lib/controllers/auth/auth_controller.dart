import 'dart:developer' as dev;

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rawr/controllers/client/client_controller.dart';
import 'package:rawr/helpers/lulz_imports.dart';
import 'package:rawr/models/remote_user.dart';
import 'package:rawr/controllers/database/remote/remote_database_controller.dart';
import 'package:rawr/views/auth/sign_in/sign_in.dart';

class AuthController extends GetxController {
  /// [appwrite]
  static final Client _client = Get.find<ClientController>().getClient;
  final Account _account = Account(_client);
  final RemoteDatabaseController _remote = Get.find<RemoteDatabaseController>();

  /// string constants
  static const String _className = 'AuthController';

  //
  // ─── CHECK AUTH STATUS ──────────────────────────────────────────────────────────
  //
  Future<bool> get checkAuthStatus async {
    try {
      /// I wish we had an auth status stream
      await _account.getSession(sessionId: LulzConst.current);
      return true;
    } catch (e) {
      /// no need for a toast message
      dev.log('auth status: no active session', name: _className);
      return false;
    }
  }
  //
  // ──────────────────────────────────────────────────────── CHECK AUTH STATUS ─────
  //

  //
  // ─── STATE MANAGEMENT ───────────────────────────────────────────────────────────
  //
  LulzUser _userData = LulzUser();
  set userEmail(String email) => _userData.email = email;
  set userPassword(String password) => _userData.password = password;
  set userUsername(String username) => _userData.username = username;

  /// It is recommended you use the member functions [getTo], [getOffAll],
  ///  or [getOff] when navigating to other screens to make sure you reset
  ///  user data both in [AuthController].
  void resetUserdata() => _userData = LulzUser();
  //
  // ───────────────────────────────────────────────────────── STATE MANAGEMENT ─────
  //

  //
  // ─── SIGN UP WITH EMAIL AND PASSOWRD ────────────────────────────────────────────
  //
  void signUpWithEmailAndPassword() async {
    try {
      /// new account
      /// new session
      /// add user info to remote database
      /// navigte to [DHome]

      /// merely creates a new account for the user
      User user = await _account.create(
        userId: 'unique()',
        email: _userData.email!,
        password: _userData.password!,
        name: _userData.username!,
      );
      _userData.userId = user.$id;
      dev.log('created a new user account', name: _className);

      /// not using [signInWithEmailAndPassword] to create the session and navigate
      ///  because I need an active session in order to add documents to a collection
      await _account.createSession(
        email: _userData.email!,
        password: _userData.password!,
      );
      dev.log(
        'created a new session with email and password',
        name: _className,
      );

      await _remote.registerNewUser(RemoteUser.fromLulzUser(_userData));

      getOffAll(const Home());
    } catch (e) {
      LulzUtils.handleError(
        toastMessage: 'error signing up',
        error: e,
        className: _className,
      );
    }
  }
  //
  // ────────────────────────────────────────── SIGN UP WITH EMAIL AND PASSOWRD ─────
  //

  //
  // ─── SIGN IN WITH EMAIL AND PASSWORD ────────────────────────────────────────────
  //
  void signInWithEmailAndPassword() async {
    try {
      _account.createSession(
        email: _userData.email!,
        password: _userData.password!,
      );
      dev.log(
        'created a new session with email and password',
        name: _className,
      );

      getOffAll(const Home());
    } catch (e) {
      LulzUtils.handleError(
          toastMessage: 'error signing in', error: e, className: _className);
    }
  }
  //
  // ────────────────────────────────────────── SIGN IN WITH EMAIL AND PASSWORD ─────
  //

  //
  // ─── SIGN IN ANON ───────────────────────────────────────────────────────────────
  //
  void signInAnon() async {
    try {
      _account.createAnonymousSession();
      dev.log('created an session anonymously', name: _className);

      getOffAll(const Home());
    } catch (e) {
      LulzUtils.handleError(
        toastMessage: 'error signing in',
        error: e,
        className: _className,
      );
    }
  }
  //
  // ───────────────────────────────────────────────────────────── SIGN IN ANON ─────
  //

  //
  // ─── SIGN OUT ───────────────────────────────────────────────────────────────────
  //
  void signOut() async {
    try {
      await _account.deleteSessions();
      dev.log('signed out', name: _className);

      getOffAll(const SignIn());
    } catch (e) {
      LulzUtils.handleError(
          toastMessage: 'error signing out', error: e, className: _className);
    }
  }
  //
  // ───────────────────────────────────────────────────────────────── SIGN OUT ─────
  //

  //
  // ─── NAVIGATION ─────────────────────────────────────────────────────────────────
  //
  void getTo(Widget page) {
    resetUserdata();
    Get.to(() => page);
  }

  void getOffAll(Widget page) {
    resetUserdata();
    Get.offAll(() => page);
  }

  void getOff(Widget page) {
    resetUserdata();
    Get.off(() => page);
  }
  //
  // ─────────────────────────────────────────────────────────────── NAVIGATION ─────
  //

  /// END [AuthController]
}
