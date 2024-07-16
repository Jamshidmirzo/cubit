import 'dart:convert';
import 'package:cubit/data/models/product.dart';
import 'package:http/http.dart' as http;

class StoreHttpService {
  final Uri url =
      Uri.parse('https://bloc-f079f-default-rtdb.firebaseio.com/.json');

  Future<Product> addProduct(
    String title,
    int price,
    String imageUrl,
    String description,
  ) async {
    Map<String, dynamic> addData = {
      'title': title,
      'price': price,
      'imageURL': imageUrl,
      'description': description,
    };
    try {
      final response = await http.post(
        url,
        body: jsonEncode(addData),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to add product');
      } else {
        final data = jsonDecode(response.body);
        addData['id'] = data['name'];
        return Product.fromJson(addData);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Product>> getProducts() async {
    List<Product> _products = [];
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic>? data = jsonDecode(response.body);
        print(data);
        data!.forEach((productId, productData) {
          productData["id"] = productId;
          _products.add(
            Product.fromJson(productData),
          );
        });
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      print('Error fetching products: $error');
    }
    return _products;
  }

  Future<void> editProduct(
    String id,
    String title,
    int price,
    String description,
  ) async {
    final editURL =
        Uri.parse('https://bloc-f079f-default-rtdb.firebaseio.com/$id.json');
    final responce = http.patch(
      editURL,
      body: jsonEncode(
        {
          'title': title,
          'price': price,
          'description': description,
        },
      ),
    );
  }

  Future<void> deleteProduct(String id) async {
    final deleteURL =
        Uri.parse('https://bloc-f079f-default-rtdb.firebaseio.com/$id.json');
    await http.delete(deleteURL);
  }
}
