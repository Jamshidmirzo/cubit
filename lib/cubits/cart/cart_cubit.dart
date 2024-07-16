import 'package:cubit/cubits/cart/cart_state.dart';
import 'package:cubit/data/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(InitialState());
  List<Product> cart = [];

  addToCart(Product porduct) {
    cart.add(porduct);
    emit(LoadedState(cart));
  }
}
