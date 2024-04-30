import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/product_view_widget.dart';

import '../../../../data/model/response/AllProductResponse.dart';

abstract class HomeState{}

class HomeInitialState extends HomeState{}







class AllProductInitialState extends HomeState {}
class AllProductLoadingState extends HomeState {}
class AllProductLoadedState extends HomeState {
  final AllProducts allProductResponse;

  AllProductLoadedState(this.allProductResponse);
}
class AllProductErrorState extends HomeState {
  final String errorMessage;

  AllProductErrorState(this.errorMessage);
}

class BestSellingProductsInitialState extends HomeState {}
class BestSellingProductsLoadingState extends HomeState {}
class BestSellingProductsLoadedState extends HomeState {
  final List<Data>? data;

  BestSellingProductsLoadedState(this.data);
}
class BestSellingProductsErrorState extends HomeState {
  final String errorMessage;

  BestSellingProductsErrorState(this.errorMessage);
}