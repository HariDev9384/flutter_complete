

import '../utils/utils.dart';


class MyProviders {
 static List<SingleChildWidget> get providers {
    return [
      ...NetworkProvider.networkProviders,
      ...HelperProvider.helperProviders
    ];
  }
}
