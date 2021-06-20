import 'package:first_proj/data/model/Restaurant/Restaurant.dart';
import 'package:first_proj/data/source/restaurants/users_data_source.dart';

class RestaurantsRepository {
  final RestaurantsDataSourceLocal _local;
  final RestaurantsDataSourceRemote _remote;

  RestaurantsRepository(this._local, this._remote);

  ///
  /// Load Restaurants
  ///
  /// first load Restaurants from local repository (in our Floor db)
  /// then check if its not null or empty,
  /// in case false return current results
  /// in case true load it from api,save it in out local db then load it
  ///
  /// CACHING ENGINE WITH REPOSITORY PATTERN
  /// -----------------
  /// Local   Remote
  ///   Repository
  /// -----------------
  ///
  Future<List<Restaurant>?> loadRestaurantsDb() {
    return _local.loadRestaurantsDb().then((restaurantsDb) {
      if (restaurantsDb == null || restaurantsDb.isEmpty) {
        return _remote
            .getRestaurants()
            .then((restaurants) => _local.saveRestaurantsDb(restaurants))
            .then((_) => _local.loadRestaurantsDb());
      } else {
        return restaurantsDb;
      }
    });
  }

  ///
  /// LoadRestaurants from Cache
  /// same logic as [loadRestaurantsCache] function
  /// but instead saving on LOCAL-DB we are using CACHE-MEMORY
  ///
  Future<List<Restaurant>?> loadRestaurantsCache() {
    return _local.loadRestaurantsCache().then((localRestaurants) {
      if (localRestaurants == null) {
        return _remote
            .getRestaurants()
            .then((restaurants) => _local.saveRestaurantsCache(restaurants))
            .then((_) => _local.loadRestaurantsCache());
      } else {
        return localRestaurants;
      }
    });
  }
}
