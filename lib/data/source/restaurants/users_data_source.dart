import 'package:first_proj/data/model/Restaurant/Restaurant.dart';

abstract class RestaurantsDataSourceLocal {
  Future<void> saveRestaurantsCache(List<Restaurant>? restaurants);

  Future<List<Restaurant>?> loadRestaurantsCache();

  Future<void> saveRestaurantsDb(List<Restaurant> restaurants);

  Future<List<Restaurant>?> loadRestaurantsDb();
}

abstract class RestaurantsDataSourceRemote {
  Future<List<Restaurant>> getRestaurants();
}
