import 'dart:async';
import 'package:floor/floor.dart';
import 'package:first_proj/data/model/user/user.dart';
import 'package:first_proj/data/source/users/local/db/user_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_data_base.g.dart';

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
