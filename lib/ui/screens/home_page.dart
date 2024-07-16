import 'package:cubit/cubits/cart/cart_cubit.dart';
import 'package:cubit/cubits/store/store_cubit.dart';
import 'package:cubit/cubits/store/store_state.dart';
import 'package:cubit/cubits/themeMode/theme_cubit.dart';
import 'package:cubit/ui/screens/cart_page.dart';
import 'package:cubit/ui/widgets/addproduct.dart';
import 'package:cubit/ui/widgets/cars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<StoreCubit>().getProducts();
    });
  }

  add(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Addproduct();
      },
    );
  }

  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          add(context);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CartPage();
                  },
                ),
              );
            },
            icon: const Icon(CupertinoIcons.cart),
          ),
        ],
        title: const Text(
          "Car shop",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            isDark = !isDark;
            context.read<ThemeCubit>().getThememode();
          },
          icon: isDark
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.light_mode),
        ),
      ),
      body: BlocBuilder<StoreCubit, StoreState>(
        builder: (context, state) {
          if (state is ErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          if(state is LoadedState){
            return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return Cars(product: product);
            },
          );
          }
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(
              child: Text("Ma'lumot hali yuklanmadi"),
            );
          }          
        },
      ),
    );
  }
}
