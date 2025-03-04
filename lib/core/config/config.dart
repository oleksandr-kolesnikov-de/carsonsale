/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2025                                               */
/* ********************************************************************************************* */

class Config {
  // Retry policy
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 2);
  // Hive configuration
  static const String hiveBoxName = 'cache';
  // Server response configuration
  static String statusCodeKey = 'statusCode';
  static String dataKey = 'data';
}