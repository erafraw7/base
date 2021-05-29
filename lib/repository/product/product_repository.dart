import 'package:fow/api/api_service.dart';
import 'package:fow/api/api_service_factory.dart';
import 'package:injectable/injectable.dart';

abstract class ProductRepository {}

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository {
  final ApiService _apiService;
  ProductRepositoryImpl(ApiServiceFactory apiServiceFactory)
      : _apiService = apiServiceFactory.get();
}
