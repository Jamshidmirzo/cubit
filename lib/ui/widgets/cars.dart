import 'package:cubit/cubits/cart/cart_cubit.dart';
import 'package:cubit/cubits/store/store_cubit.dart';
import 'package:cubit/data/models/product.dart';
import 'package:cubit/ui/widgets/editproduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// ignore: must_be_immutable
class Cars extends StatelessWidget {
  Product product;
  Cars({super.key, required this.product});
  edit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Editproduct(product: product);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartcontroller = context.read<CartCubit>();

    final controller = context.read<StoreCubit>();
    return ZoomTapAnimation(
      onLongTap: () {
        controller.isDelete(product.id);
      },
      onTap: () {
        edit(context);
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cartcontroller.addToCart(product);
                  },
                  icon: const Icon(CupertinoIcons.cart),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.price.toString(),
                  style: const TextStyle(
                      color: Colors.pink,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    controller.isFavourite(product.id);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: product.isFavorurite ? Colors.pink : Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              width: 200,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    product.imageUrl,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
