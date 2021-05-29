import 'dart:async';

import 'package:floor/floor.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'daos/fow_dao.dart';
import 'entities/fow_entity.dart';

part 'database_manager.g.dart';

@Database(version: 1, entities: [FowEntity])
abstract class DatabaseManager extends FloorDatabase {
  FowDao get savedGifsDao;
}

@injectable
@lazySingleton
class DatabaseProvider {
  late DatabaseManager database;

  DatabaseProvider() {
    build();
  }

  Future<void> build() async {
    database =
        await $FloorDatabaseManager.databaseBuilder('database.db').build();
  }
}
