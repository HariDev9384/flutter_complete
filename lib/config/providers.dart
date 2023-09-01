

import '../utils/utils.dart';

class MyProvider {
  List<SingleChildWidget> get providers => [
   ...NetworkProvider().networkProviders,
   ...HelperProvider().helperProviders
  ];
}