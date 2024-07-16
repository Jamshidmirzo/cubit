import 'package:cubit/data/models/product.dart';

sealed class StoreState {}

final class InitialState extends StoreState {}

final class LoadingState extends StoreState {}

final class LoadedState extends StoreState {
  List<Product> products = [];
  LoadedState(this.products);
}

final class ErrorState extends StoreState {
  String message;
  ErrorState({required this.message});
}

final class DeleteErrorState extends StoreState {
  final String message;
  DeleteErrorState({required this.message});
}
