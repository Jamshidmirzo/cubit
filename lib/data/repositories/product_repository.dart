import 'package:cubit/data/models/product.dart';
import 'package:cubit/services/store_http_service.dart';

abstract class InterfaceStoreRepository {
  Future<Product> addProduct(
    String title,
    int price,
    String imageUrl,
    String description,
  );
  Future<List<Product>> getProduct();
  Future<void> editProduct(
    String id,
    String title,
    int price,
    String description,
  );
  Future<void> deleteProduct(String id);
}

class StoreRepository extends InterfaceStoreRepository {
  final StoreHttpService storeHttpService;
  StoreRepository(this.storeHttpService);
  @override
  Future<Product> addProduct(
    String title,
    int price,
    String imageUrl,
    String description,
  ) async {
    return await storeHttpService.addProduct(
        title, price, imageUrl, description);
  }

  @override
  Future<void> deleteProduct(
    String id,
  ) async {
    await storeHttpService.deleteProduct(id);
  }

  @override
  Future<void> editProduct(
    String id,
    String title,
    int price,
    String description,
  ) async {
    await storeHttpService.editProduct(id, title, price, description);
  }

  @override
  Future<List<Product>> getProduct() async {
    try {
      List<Product> _products = [];
      _products = await storeHttpService.getProducts();
      return [..._products];
    } catch (error) {
      rethrow;
    }
  }
}
