part of './lulz_imports.dart';

class LulzUtils {
  //
  // ─── HANDLE ERROR ───────────────────────────────────────────────────────────────
  //

  /// [toastMessage] is displayed on the screen to the user
  /// [error] is outputted to the console
  static void handleError(
      {required String toastMessage,
      required Object error,
      required String className}) {
    /// show toast
    /// TODO: add toast
    Get.showSnackbar(GetSnackBar(
      title: '',
      message: toastMessage,
    ));

    /// log
    dev.log(
      toastMessage,
      name: className,
      error: error,
    );
  }
  //
  // ───────────────────────────────────────────────────────────── HANDLE ERROR ─────
  //

  /// END LULZ UTILS
}
