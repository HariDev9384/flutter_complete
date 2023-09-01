import 'package:flutter/foundation.dart';

import '../utils/utils.dart';

class LocalizationHelper extends ChangeNotifier{
  SecureStorageService storage=SecureStorageService();
  Locale? defaultLocale;
  Locale get defaultlocale=>defaultLocale!;
   // locale to json
    Map<String, dynamic> localeToJson(Locale locale) {
      return {
        'languageCode': locale.languageCode,
        'countryCode': locale.countryCode,
      };
     }

  // json to locale

  Locale localeFromJson(Map<String, dynamic> json) {
  return Locale(json['languageCode'], json['countryCode']);
}

  // store locale to storage
  storeLocale(Locale locale){
   Map json= localeToJson(locale);
   storage.storeData('locale', json.toString());
   retrieveLocale();
   notifyListeners();
  }

  // retreive locale from storage
Future<void> retrieveLocale() async {
  var jsonString = await storage.retrieveData('locale');
    notifyListeners();
  if(jsonString!=null){
  Map<String,dynamic> json=stringtoLocaleJson(jsonString);
  Locale locale=localeFromJson(json);
  defaultLocale=locale;
  notifyListeners();
  }else{    
     defaultLocale=const Locale('en,US');
     notifyListeners();
  }
}

langugetoLocale(language){
    notifyListeners();
  switch (language) {
    case Languages.english:
          notifyListeners();
          return const Locale('en','US');
    case Languages.kannada:
          notifyListeners();
          return const Locale('kn','IN');
    case Languages.tamil:
          notifyListeners(); 
          return const Locale('ta','IN');
    case Languages.telugu:
          notifyListeners();
          return const Locale('te','IN');
    case Languages.spanish:
          notifyListeners();
          return const Locale('es','ES');
    case Languages.malayalam:
          notifyListeners();
          return const Locale('ml','IN');        
    default:
          notifyListeners();
          return const Locale('en','US');
  }
}

stringtoLocaleJson(jsonString){
  if (jsonString != null) {
    // Remove the leading and trailing curly braces and whitespace
    jsonString = jsonString.trim();
    if (jsonString.startsWith("{") && jsonString.endsWith("}")) {
      jsonString = jsonString.substring(1, jsonString.length - 1);
    }
    // Split the string into key-value pairs
    var keyValuePairs = jsonString.split(', ');
    // Create a map from the key-value pairs
    var jsonData = <String, String>{};
    for (var pair in keyValuePairs) {
      var parts = pair.split(': ');
      if (parts.length == 2) {
        var key = parts[0].trim();
        var value = parts[1].trim();
        // Remove double quotes from keys and values
        key = key.replaceAll('"', '');
        value = value.replaceAll('"', '');
        jsonData[key] = value;
      }
    }
    notifyListeners();
    return jsonData;

  } else {
    if (kDebugMode) {
      print('String from storage is null or empty.');
    }
  }
}

@override
  void notifyListeners() {
    super.notifyListeners();
  }
}