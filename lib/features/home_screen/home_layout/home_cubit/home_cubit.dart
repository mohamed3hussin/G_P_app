import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/data/model/response/AllProductResponse.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import '../../../../core/shared_widget/constants.dart';
import '../../../../data/api/api_manager.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  void getAllProduct({String sort = 'name'}) {
    emit(AllProductLoadingState());
    ApiManager.getData(
      url: 'Product',
      query: {
        'sort': sort,
        'isDesigned': 'false',
        'PageIndex': '1',
        'PageSized': '3',
      },
      token: token,
    ).then((response) {
      emit(AllProductLoadedState(AllProducts.fromJson(response.data)));
      if (response.data == null) {
        emit(AllProductErrorState("Oops! no results!"));
      }
    }).catchError((error) {
      print(error.toString());
      emit(AllProductErrorState(error.toString()));
    });
  }

  void getBestSellingProduct({String sort = 'name'}) {
    emit(BestSellingProductsLoadingState());
    ApiManager.getData(
      url: 'Product/BestSelling',
      query: {
        'sort': sort,
        'isDesigned': 'false',
        'PageIndex': '1',
        'PageSized': '3',
      },
      token: token,
    ).then((response) {
      final List<dynamic> responseData = response.data;
      final List<Data> products =
          responseData.map((json) => Data.fromJson(json)).toList();
      emit(BestSellingProductsLoadedState(products));
      if (response.data == null) {
        emit(BestSellingProductsErrorState("Oops! no results!"));
      }
    }).catchError((error) {
      print(error.toString());
      emit(BestSellingProductsErrorState(error.toString()));
    });
  }
}
