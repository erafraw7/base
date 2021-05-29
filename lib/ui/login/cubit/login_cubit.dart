import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fow/repository/product/product_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final ProductRepository repository;
  LoginCubit(this.repository) : super(const LoginState.loading());
}

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.loading() = LoginStateLoading;
  const factory LoginState.loaded() = LoginStateLoaded;
}
