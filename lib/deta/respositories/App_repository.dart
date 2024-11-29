import 'package:uzum_market/deta/api_services/product_services.dart';

class AppRepository {
  static Future<List?> getAllProductsByCategoryFromApi(String category) async =>
      await getAllProductsByCategory(category);
}
