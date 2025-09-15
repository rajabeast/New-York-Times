part of 'utils.dart';

class LoggerUtils {
  void logInfo(String tag, String message) {
    developer.log('INFO: $message', name: tag);
  }

  void logError(String tag, String message) {
    developer.log('ERROR: $message', name: tag);
  }

  void logDebug(String tag, String message) {
    developer.log('DEBUG: $message', name: tag);
  }
}
