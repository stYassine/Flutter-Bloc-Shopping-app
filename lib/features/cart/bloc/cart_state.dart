part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

sealed class CartActionState extends CartState {}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  
  CartSuccessState({required this.cartItems});

  final List<ProductDataModel> cartItems;
}
