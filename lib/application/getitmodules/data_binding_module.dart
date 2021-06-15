import 'package:first_proj/application/db/app_data_base.dart';
import 'package:first_proj/main.dart';

class DataBindingModule {
  static providesModules() {
    _providesFloorDb();
    _providesUserDao();
  }

  static _providesFloorDb() {
    getIt.registerSingletonAsync(
        () => $FloorAppDatabase.databaseBuilder("app_database.db").build());
  }

  static _providesUserDao() {
    getIt.registerSingletonAsync(
        () => getIt.getAsync<AppDatabase>().then((db) => db.userDao),
        dependsOn: [AppDatabase]);
  }
}
