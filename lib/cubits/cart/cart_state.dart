import 'package:cubit/data/models/product.dart';

sealed class CartState {}

final class InitialState extends CartState {}

final class LoadingState extends CartState {}

final class LoadedState extends CartState {
  List<Product> products=[];
  LoadedState(this.products);
}

final class ErrorState extends CartState {
  String message;
  ErrorState({required this.message});
}
