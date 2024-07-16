import 'package:cubit/cubits/cart/cart_cubit.dart';
import 'package:cubit/cubits/store/store_cubit.dart';
import 'package:cubit/cubits/themeMode/theme_cubit.dart';
import 'package:cubit/data/repositories/product_repository.dart';
import 'package:cubit/services/store_http_service.dart';
import 'package:cubit/ui/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) {
            return StoreRepository(StoreHttpService());
          },
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (ctx) => ThemeCubit(),
          ),
          BlocProvider(
            create: (ctx) => StoreCubit(ctx.read<StoreRepository>()),
          ),
          BlocProvider(
            create: (ctx) => CartCubit(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, theme) {
            return MaterialApp(
              theme: theme,
              debugShowCheckedModeBanner: false,
              home: Homepage(),
            );
          },
        ),
      ),
    );
  }
}
