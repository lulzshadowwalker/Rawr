part of '../../../helpers/lulz_imports.dart';
class ClientBinding extends Bindings {
  @override
  void dependencies() {
    /// ! order is important
    Get.put(ClientController(), permanent: true);
    Get.put(RemoteDatabaseController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}
