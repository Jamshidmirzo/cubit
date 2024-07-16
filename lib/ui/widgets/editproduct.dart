import 'package:cubit/cubits/store/store_cubit.dart';
import 'package:cubit/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Editproduct extends StatefulWidget {
  Product product;
  Editproduct({super.key, required this.product});

  @override
  State<Editproduct> createState() => _EditproductState();
}

class _EditproductState extends State<Editproduct> {
  final titlecontroller = TextEditingController();

  final pricecontroller = TextEditingController();

  final desccontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    titlecontroller.text = widget.product.title;
    pricecontroller.text = widget.product.price.toString();
    desccontroller.text = widget.product.description;
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<StoreCubit>();
    save() {
      if (formkey.currentState!.validate()) {
        formkey.currentState!.save();
        controller.edit(widget.product.id, desccontroller.text,
            int.parse(pricecontroller.text), titlecontroller.text);
        Navigator.pop(context);
      }
    }

    return AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Back"),
        ),
        ElevatedButton(
          onPressed: save,
          child: const Text("Done"),
        ),
      ],
      content: Form(
        key: formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Ma`lumot kirg`izng!';
                }
                return null;
              },
              controller: titlecontroller,
              decoration: InputDecoration(
                labelText: 'Input title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Ma`lumot kirg`izng!';
                }

                return null;
              },
              controller: pricecontroller,
              decoration: InputDecoration(
                labelText: 'Input price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Ma`lumot kirg`izng!';
                }
                return null;
              },
              controller: desccontroller,
              decoration: InputDecoration(
                labelText: 'Input description!',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
