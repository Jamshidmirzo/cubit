import 'package:cubit/cubits/store/store_state.dart';
import 'package:cubit/data/models/product.dart';
import 'package:cubit/data/repositories/product_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit(this.interfaceStoreRepository) : super(InitialState());
  final InterfaceStoreRepository interfaceStoreRepository;
  Future<void> getProducts() async {
    emit(LoadingState());
    try {
      emit(
        LoadedState(await interfaceStoreRepository.getProduct()),
      );
    } catch (e) {
      emit(ErrorState(message: 'Mahsulot yuklay olmadik !'));
    }
  }

  Future<void> addProducts(
      String newTitle, String description, String imageURL, int price) async {
    try {
      final data = await interfaceStoreRepository.addProduct(
          newTitle, price, imageURL, description);

      emit(
        LoadedState(await interfaceStoreRepository.getProduct()),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> edit(
      String id, String description, int price, String newTitle) async {
    emit(LoadingState());
    try {
      await interfaceStoreRepository.editProduct(
          id, newTitle, price, description);
      emit(
        LoadedState(await interfaceStoreRepository.getProduct()),
      );
    } catch (error) {
      print(error.toString());
    }
  }

  isFavourite(String id) {
    // products = (state as LoadedState).products;
    // for (var element in products) {
    //   if (element.id == id) {
    //     element.isFavorurite = !element.isFavorurite;
    //   }
    // }
    // emit(LoadedState(products));
  }

  isDelete(String id) async {
    try {
      await interfaceStoreRepository.deleteProduct(id);
      emit(
        LoadedState(await interfaceStoreRepository.getProduct()),
      );
    } catch (error) {
      emit(DeleteErrorState(message: error.toString()));
    }
  }
}
// for (var element in products) {
//       if (element.id == id) {
//         products.remove(element);
//       }
//     }


     // await Future.delayed(Duration(seconds: 2));
      // products.add(
      //   Product(
      //       id: '1',
      //       imageUrl:
      //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHBMI1jhJpZvoZZ7mTkeNc9LUqTuwx_k4Xgg&s',
      //       price: 12000,
      //       title: 'Lamborgini',
      //       description: 'The first car which i wanted a bought!'),
      // );


 // products = (state as LoadedState).products;
        // emit(LoadingState());
        // Future.delayed(
        //   const Duration(seconds: 2),
        // );
        // products.add(
        //   Product(
        //       id: UniqueKey().toString(),
        //       imageUrl: imageURL,
        //       price: price,
        //       title: newTitle,
        //       description: description),
        // );


            // for (var element in products) {
    //   if (element.id == id) {
    //     element.description = description;
    //     element.price = price;
    //     element.title = newTitle;
    //   }
    // }