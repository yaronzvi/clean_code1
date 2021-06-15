import 'package:first_proj/application/db/app_data_base.dart';
import 'package:first_proj/data/source/users/local/db/user_dao.dart';
import 'package:first_proj/data/source/users/local/users_local_repository.dart';
import 'package:first_proj/data/source/users/remote/users_remote_repository.dart';
import 'package:first_proj/data/source/users/users_data_source.dart';
import 'package:first_proj/data/source/users/users_repository.dart';
import 'package:first_proj/main.dart';

class RepositoryBindingModule {
  static provideModules() {
    _provideUsersRepository();
  }

  static _provideUsersRepository() {
    getIt.registerSingleton<UsersDataSourceRemote>(
        UsersRemoteRepository(getIt.get()));
    getIt.registerSingletonWithDependencies<UsersDataSourceLocal>(
        () => UsersLocalRepository(getIt.get()),
        dependsOn: [UserDao]);
    getIt.registerSingletonWithDependencies(
        () => UsersRepository(getIt.get(), getIt.get()),
        dependsOn: [UsersDataSourceLocal]);
  }
}
