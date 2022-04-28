import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:rawr/local/lulz_local.dart';

class ClientController extends GetxController {
  final Client _client = Client();

  Client get getClient => _client;

  @override
  void onInit() {
    super.onInit();
    _client
        .setEndpoint(LulzLocal.endpoint) // Your Appwrite Endpoint
        .setProject(LulzLocal.projectId) // Your project ID
        .setSelfSigned(status: true);
  }
}
