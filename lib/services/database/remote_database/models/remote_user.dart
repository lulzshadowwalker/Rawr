import 'package:rawr/helpers/lulz_imports.dart';

class RemoteUser {
  String? email;
  String? username;
  String? userId;

  RemoteUser({
    String? email,
    String? username,
    String? userId,
  });

  RemoteUser.fromLulzUser(LulzUser lulzUser)

      /// Special model because [appwrite] would not a document if the data
      ///  structure is not compatible
      : email = lulzUser.email,
        username = lulzUser.username,
        userId = lulzUser.userId;
}
