import '../utils/utils.dart';

class SecureStorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> storeData(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }
  
  



  Future<String?> retrieveData(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> deleteData(String key) async {
    await _secureStorage.delete(key: key);
  }


}
