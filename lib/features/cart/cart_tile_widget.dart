import 'package:flutter/material.dart';
import 'package:shopping_app_with_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:shopping_app_with_bloc/features/home/models/home_product_data.dart';

class CartTileWidget extends StatelessWidget {
  const CartTileWidget({super.key, required this.cartBloc, required this.productDataModel});

  final CartBloc cartBloc;
  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          Text(productDataModel.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(productDataModel.description),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$' + productDataModel.price.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      // cartBloc.add(HomeProductWishListButtonClickedEvent(clickedProduct: productDataModel));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_bag_outlined, color: Colors.red),
                    onPressed: () {
                      cartBloc.add(CartRemoveFromEvent(productDataModel: productDataModel));
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
