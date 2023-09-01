import '../utils/utils.dart';

class HelperProvider {
  List<SingleChildWidget> get helperProviders => [
    ChangeNotifierProvider(create: (_) => LocalizationHelper()),
    ChangeNotifierProvider(create: (_) => ThemeHelper())
    // Add other providers here if needed.
  ];
}