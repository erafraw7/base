import 'package:floor/floor.dart';

@dao
abstract class FowDao {
  @Query('DELETE FROM SavedGif WHERE id = :id')
  Future<void> removeGif(String id);
}
