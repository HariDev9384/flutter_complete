import '../utils/utils.dart';

class NetworkProvider {
 static List<SingleChildWidget> get networkProviders {
  final Dio client=Clients().getClient;
   return [
    // Add other providers here if needed.
    ChangeNotifierProvider(create: (_)=> ProductsViewModel(repo: ProductRepository(client: client)))
  ];
 }
}