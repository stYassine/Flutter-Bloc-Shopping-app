part of 'home_bloc.dart';

// state are of 2 types
// 1- simple state that going to build the UI
// 2- actionable state, if we get those state in the UI we want to take some action

abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

/// Ui State
class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  
  HomeLoadedSuccessState({required this.products});

}

class HomeErrorState extends HomeState {}

// Action state
class HomeNavigateToWishListPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeActionState {}
class HomeProductItemCartedActionState extends HomeActionState {}
