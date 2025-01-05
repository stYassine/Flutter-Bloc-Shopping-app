part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent{}

class CartRemoveFromEvent extends CartEvent{
  // pass data through events
  CartRemoveFromEvent({required this.productDataModel});

  final ProductDataModel productDataModel;
}