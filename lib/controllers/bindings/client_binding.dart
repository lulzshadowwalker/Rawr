import 'package:get/get.dart';
import 'package:rawr/controllers/client_controller.dart';
import 'package:rawr/services/authentication/authentication_controller.dart';

class ClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ClientController(), permanent: true);
    Get.put(AuthenticationController(), permanent: true);
  }
}
