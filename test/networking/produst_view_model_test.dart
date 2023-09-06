import 'package:complete/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'produst_view_model_test.mocks.dart';

@GenerateMocks([ProductRepository,ProductsViewModel])
productApi() {
  late ProductsViewModel productsViewModel;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    productsViewModel = ProductsViewModel(repo: mockProductRepository);
  });

  test('fetchProductListApi completes successfully', () async {
  // Arrange
  final responseData = {
    "userId": 1,
    "id": 1,
    "title": "quidem molestiae enim"
  };
  when(mockProductRepository.getProducts()).thenAnswer((_) async => responseData);

  // Act
  await productsViewModel.fetchProductListApi();

  // Assert
  expect(productsViewModel.product.status, Status.completed);
  expect(productsViewModel.product.data, isNotNull);
  expect(productsViewModel.product.data?.userId, 1);
  expect(productsViewModel.product.data?.id, 1);
  expect(productsViewModel.product.data?.title, "quidem molestiae enim");
  // Add more assertions based on your use case
});


  test('fetchProductListApi handles error', () async {
    // Arrange
    when(mockProductRepository.getProducts()).thenThrow(const SocketException('no network'));

    // Act
    await productsViewModel.fetchProductListApi();

    // Assert
    expect(productsViewModel.product.status, Status.error);
    expect(productsViewModel.product.message, 'SocketException: no network');
  });
}