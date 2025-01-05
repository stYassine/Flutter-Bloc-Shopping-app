import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app_with_bloc/data/cart_items.dart';
import 'package:shopping_app_with_bloc/features/home/models/home_product_data.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromEvent>(cartRemoveFromEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit){
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromEvent(CartRemoveFromEvent event, Emitter<CartState> emit){
    cartItems.remove(event.productDataModel);
    // emit success state to re-build the car page UI
    emit(CartSuccessState(cartItems: cartItems));
  }

}
