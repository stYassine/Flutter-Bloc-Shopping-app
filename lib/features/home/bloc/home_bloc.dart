import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app_with_bloc/data/cart_items.dart';
import 'package:shopping_app_with_bloc/data/grocery_data.dart';
import 'package:shopping_app_with_bloc/data/wishlist_items.dart';
import 'package:shopping_app_with_bloc/features/home/models/home_product_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    // mimic server loading delay
    await Future.delayed(Duration(seconds: 3));

    List<ProductDataModel> products = [];
    
    for(int i = 0; i < GroceryData.groceryProducts.length; i++){
      var currentProduct = GroceryData.groceryProducts[i];
      
      ProductDataModel productDataModel = ProductDataModel(
        id: currentProduct['id'], 
        name: currentProduct['name'], 
        description: currentProduct['description'], 
        price: currentProduct['price'], 
        imageUrl: currentProduct['imageUrl']
      );

      products.add(productDataModel);

    }
    print("Zzzzn : ${products.toList()}");
    emit(HomeLoadedSuccessState(products: products));


  }

  FutureOr<void> homeProductWishListButtonClickedEvent(HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    wishlistItems.add(event.clickedProduct);
    
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    cartItems.add(event.clickedProduct);

    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishListButtonNavigateEvent(HomeWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());
  }
}
