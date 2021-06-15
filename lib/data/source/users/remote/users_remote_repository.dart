import 'package:first_proj/data/model/user/user.dart';
import 'package:first_proj/data/source/users/users_data_source.dart';
import 'package:first_proj/data/source/users/api/users_api.dart';

class UsersRemoteRepository implements UsersDataSourceRemote {
  final UsersApi _api;

  UsersRemoteRepository(this._api);

  @override
  Future<List<User>> getUsers() {
    return _api.getUsers().then((response) => response.users);
  }
}
