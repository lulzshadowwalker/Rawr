import 'package:get/get.dart';
import '../../../services/authentication/authentication_controller.dart';
import '../client_controller.dart';

class ClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ClientController(), permanent: true);
    Get.put(AuthenticationController(), permanent: true);
  }
}
