// packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// block
import 'package:shopping_app_with_bloc/features/home/bloc/home_bloc.dart';

// pages
import 'package:shopping_app_with_bloc/features/cart/cart.dart';
import 'package:shopping_app_with_bloc/features/home/ui/product_tile_widget.dart';
import 'package:shopping_app_with_bloc/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        // i want to take action, when my state is actionState
        listenWhen: (previous, current) => current is HomeActionState,
        // i want to build my UI when i get a HomeState
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          print(state.toString());

          if (state is HomeNavigateToCartPageActionState) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
          } else if (state is HomeNavigateToWishListPageActionState) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Wishlist()));
          }else if(state is HomeProductItemWishlistedActionState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Item Wishlisted")
              )
            );
          }else if(state is HomeProductItemCartedActionState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Item Carted")
              )
            );
          }

        },
        builder: (context, state) {
          switch (state.runtimeType) {
            // Loading
            case HomeLoadingState:
              return Scaffold(
                body: CircularProgressIndicator(),
              );
            // Loaded Successfully
            case HomeLoadedSuccessState:
              // access variables passed in this state (products)
              final successState = state as HomeLoadedSuccessState;
              return Scaffold(
                appBar: AppBar(
                  title: Text("Grocery App"),
                  backgroundColor: Colors.teal,
                  actions: [
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        homeBloc.add(HomeWishListButtonNavigateEvent());
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.shopping_bag_outlined),
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                    ),
                  ],
                ),
                body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                      homeBloc: homeBloc, 
                      productDataModel: successState.products[index]
                    );
                  }
                ),
              );
            // Loading Failed
            case HomeErrorState:
              return Scaffold(
                body: Text("ERROR NOT PRODUCTS NOT LOADED"),
              );

            default:
              return Scaffold(
                body: Text("data"),
              );
          }
        });
  }
}
