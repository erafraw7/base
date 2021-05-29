import 'package:floor/floor.dart';

@entity
class FowEntity {
  @primaryKey
  final String id;
  final String url;
  final String originalUrl;
  final String previewUrl;
  final String previewWidth;
  final String previewHeight;

  FowEntity(this.id, this.url, this.originalUrl, this.previewUrl,
      this.previewWidth, this.previewHeight);
}
