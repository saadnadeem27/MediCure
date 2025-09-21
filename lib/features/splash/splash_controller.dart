import 'package:get/get.dart';
import '../../app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _checkAuthenticationStatus();
  }

  void _checkAuthenticationStatus() async {
    // Simulate loading time for splash screen
    await Future.delayed(const Duration(seconds: 3));

    // For now, always go to login screen
    // Later we can implement proper auth checking
    Get.offAllNamed(AppRoutes.login);
  }
}
