import 'package:get/get.dart';
import 'package:rawr/services/auth/auth_controller.dart';
import 'package:rawr/services/database/remote_database/remote_database_controller.dart';

import '../client_controller.dart';

class ClientBinding extends Bindings {
  @override
  void dependencies() {
    /// ! order is important
    Get.put(ClientController(), permanent: true);
    Get.put(RemoteDatabaseController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}
