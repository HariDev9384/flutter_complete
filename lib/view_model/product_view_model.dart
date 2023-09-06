

import '../utils/utils.dart';

class ProductsViewModel extends ChangeNotifier {
   ProductRepository repo;
  ProductsViewModel({required this.repo});

  ApiResponse<Product> product = ApiResponse.loading();

  setProductList(ApiResponse<Product> response) {
    product = response;
    notifyListeners();
  }

  Future<void> fetchProductListApi() async {
    setProductList(ApiResponse.loading());
    try {
      final data = await repo.getProducts();
      setProductList(ApiResponse.completed(Product.fromJson(data)));
    } catch (error) {
      setProductList(ApiResponse.error(error.toString()));
    }
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
