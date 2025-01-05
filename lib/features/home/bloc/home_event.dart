part of 'home_bloc.dart';

// import 'package:flutter/material.dart';

// @immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent {
  // pass data through events
  HomeProductWishListButtonClickedEvent({required this.clickedProduct});

  final ProductDataModel clickedProduct;
}
class HomeProductCartButtonClickedEvent extends HomeEvent {
  // pass data through events
  HomeProductCartButtonClickedEvent({required this.clickedProduct});

  final ProductDataModel clickedProduct;
}

class HomeWishListButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
