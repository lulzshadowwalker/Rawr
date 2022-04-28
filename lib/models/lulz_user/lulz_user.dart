part of '../../helpers/lulz_imports.dart';

class LulzUser {
  String? email;
  String? username;
  String? userId;

  /// state management
  String? password;

  LulzUser({
    String? email,
    String? username,
    String? userId,
  });

  LulzUser.fromRemoteUser(RemoteUser remoteUser)

      /// Special model because [appwrite] would not a document if the data
      ///  structure is not compatible
      : email = remoteUser.email,
        username = remoteUser.username,
        userId = remoteUser.userId;
}
