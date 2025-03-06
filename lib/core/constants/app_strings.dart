/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

class AppStrings {
  // General
  static const String appName = 'CarOnSale Challenge';

  // Login
  
  // Home screen
  static const String homeScreenTitle = 'Challenge: home';
  static const String homeSearchHint = 'Enter VIN code';
  static const String homeSearchButton = 'Search';
  static const String homeCarModel = 'Model';
  static const String homeCarUuid = 'UUID';
  static const String homeFeedbackPositive = 'Recommended by other users';
  static const String homeFeedbackNegative = 'Not recommended by other users';
  static const String homeVehicleSelectionTitle = 'Search results';
  static const String homeErrorRetry = 'Retry';
  static const String homeStartString = "No search results yet. Please enter a VIN code and press 'Search'";
  static const String homeProfileString = 'Logged in as: ';

  // Login screen
  static const String loginScreenTitle = 'Challenge: login';
  static const String loginUserHint = 'Enter your name';
  // Error messages
  static const String errorUnknown = 'Unknown error';
  static const String errorMaxRetries = 'Server error. Max number of retry attempt was reached';
  static const String errorTitle = 'An error occurred while processing your request: ';

  // Debug messages
  static const String debugCacheFailurePrefix = 'Cache Failure: ';
  static const String debugCacheParseError = 'Cache Error: Failed to parse data';
  static const String debugCacheHit = 'Cache Hit: Returning Cached Data';
  static const String debugStatusCode = 'Status code: ';
  static const String debugBody = 'Body: ';
}

