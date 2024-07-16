import 'package:cubit/cubits/cart/cart_cubit.dart';
import 'package:cubit/cubits/cart/cart_state.dart';
import 'package:cubit/ui/screens/done_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CartCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart page"),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        bloc: controller,
        builder: (context, state) {
          if (state is ErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is InitialState) {
            return const Center(
              child: Text("Ma'lumot hali yuklanmadi"),
            );
          }

          final products = (state as LoadedState).products;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ZoomTapAnimation(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DonePage();
                      },
                    ),
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(product.title),
                  subtitle: Text("\$${product.price}"),
                  trailing: const Icon(
                    Icons.money_outlined,
                    size: 40,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
