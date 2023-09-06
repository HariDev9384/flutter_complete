

// Define an enum for the different log levels

import '../../utils/utils.dart';

enum Level { debug, info, warning, error, alien , request , response}

// Define a logDebug function that logs messages at the specified level
// log different colors
void logDebug(String message, {Level level = Level.info}) {
  // Define ANSI escape codes for different colors
  const String resetColor = '\x1B[0m';
  const String redColor = '\x1B[31m'; // Red
  const String greenColor = '\x1B[32m'; // Green
  const String yellowColor = '\x1B[33m'; // Yellow
  const String cyanColor = '\x1B[36m'; // Cyan 
  const String requestColor = '\x1B[33m';
  // Define color icons for different log levels
  const String debugIcon = '🐛'; // Magnifying glass for debug
  const String infoIcon = 'ℹ️'; // Information mark for info
  const String warningIcon = '⚠️'; // Warning sign for warning
  const String errorIcon = '❌'; // Cross mark for error
  const String alienIcon = '👽'; // Alien emoji for alien

  const String requestIcon='➡️';
  const String responseIcon='⬅️';


  // Get the current time in hours, minutes, and seconds
  final now = DateTime.now();
  final timeString =
      '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

  // Only log messages if the app is running in debug mode
  if (kDebugMode) {
    try {
      String logMessage;
      switch (level) {
        case Level.debug:
          logMessage =
              '$cyanColor[$debugIcon][$timeString] $message$resetColor';
          break;
        case Level.info:
          logMessage = '$greenColor[ $infoIcon ][$timeString] $message$resetColor';
          break;
        case Level.warning:
          logMessage = '$yellowColor[$warningIcon][$timeString] $message $resetColor';
          break;
        case Level.error:
          logMessage = '$redColor[$errorIcon][$timeString] $message $resetColor';
          break;
        case Level.alien:
          logMessage = '$redColor[$alienIcon][$timeString] $message $resetColor';
          break;
        case Level.request:
          logMessage = '$requestColor[$requestIcon][$timeString] $message $resetColor';
          break;
        case Level.response: 
          logMessage = '$requestColor[$responseIcon][$timeString] $message $resetColor';
      }
      debugPrint(logMessage);
    } catch (e) {
      print(e.toString());
    }
  }
}

// Define an interceptor that logs the requests and responses
class LoggerInterceptor extends Interceptor {
  void printStraightLine(int length, String character) {
  for (int i = 0; i < length; i++) {
    logDebug(character);
  }
}
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';

    // Log the error request and error message
    logDebug('onError: ${options.method} request => $requestPath',
        level: Level.error);
    logDebug('onError: ${err.error}, Message: ${err.message}',
        level: Level.debug);

    // Call the super class to continue handling the error
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';

    // Log request details
    logDebug('onRequest: ${options.method} request => $requestPath', 
        level: Level.request);
    logDebug('onRequest: Request Headers => ${options.headers}',
        level: Level.info);
    logDebug('onRequest: Request Data => ${_prettyJsonEncode(options.data)}',
        level: Level.info); // Log formatted request data

        logDebug('onRequest: Request Query Parameters => ${_prettyJsonEncode(options.queryParameters)}',
        level: Level.info); // Log formatted request query parameters

        

    // Call the super class to continue handling the request
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Log the response status code and data
    logDebug(
        'onResponse: StatusCode: ${response.statusCode}, Data: ${_prettyJsonEncode(response.data)}', level: Level.response); // Log formatted response data
    logDebug(
        '.........................................................................\n\n\n\n');

    // Call the super class to continue handling the response
    return super.onResponse(response, handler);
  }

  // Helper method to convert data to pretty JSON format
  String _prettyJsonEncode(dynamic data) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      final jsonString = encoder.convert(data);
      return jsonString;
    } catch (e) {
      return data.toString();
    }
  }
}
