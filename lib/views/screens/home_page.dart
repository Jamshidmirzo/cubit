import 'package:cubit/controllers/cubit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubirtcontroller = context.read<CubitController>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              cubirtcontroller.decrement();
            },
            icon: const Icon(Icons.remove),
          ),
          IconButton(
            onPressed: () {
              cubirtcontroller.increment();
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: BlocBuilder<CubitController, int>(
          bloc: cubirtcontroller,
          builder: (context, snapshot) {
            return Center(
              child: Text(cubirtcontroller.state.toString()),
            );
          }),
    );
  }
}
