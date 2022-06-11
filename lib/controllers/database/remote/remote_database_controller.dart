import 'dart:developer' as dev;

import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:rawr/controllers/client/client_controller.dart';
import 'package:rawr/helpers/lulz_imports.dart';
import 'package:rawr/local/lulz_local.dart';
import 'package:rawr/models/remote_user.dart';

class RemoteDatabaseController extends GetxController {
  static final Client _client = Get.find<ClientController>().getClient;
  final Database _remote = Database(_client);

  /// string constants
  static const String _className = 'RemoteDatabaseController';

  //
  // ─── REGISTER NEW USER ──────────────────────────────────────────────────────────
  //
  Future<void> registerNewUser(RemoteUser remoteUser) async {
    try {
      await _remote.createDocument(
        collectionId: LulzLocal.usersCollection,
        documentId: 'unique()',
        data: {
          LulzConst.email: remoteUser.email,
          LulzConst.username: remoteUser.username,
          LulzConst.userId: remoteUser.userId,
        },
      );
      dev.log('user added to remote database', name: _className);
    } catch (e) {
      dev.log(
        'error adding user to remote database', 
        error: e,
        name: _className,
      );
    }
  }
  //
  // ──────────────────────────────────────────────────────── REGISTER NEW USER ─────
  //

}
