

import '../utils/utils.dart';

class ProductRepository{
 final Dio client;
  late NetworkService network;

  ProductRepository({required this.client}) {
    network = NetworkService(client: client);
  }
    Future<dynamic> getProducts() async {
    try {
      final response = await network.getGetApiResponse(url: '/albums/1');
      return response;
    } catch (e) {
      rethrow; //Big Brain
    }
  }
}