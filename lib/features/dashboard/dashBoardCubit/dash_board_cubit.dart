import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/features/dashboard/dashBoardCubit/dash_board_state.dart';

import '../../../core/cach_helper/cach_helper.dart';
import '../../../data/api/api_manager.dart';
import '../../../data/model/response/AllProductResponse.dart';
import '../../../data/model/response/DeliveryMethodsResponse.dart';

class DashBoardCubit extends Cubit<DashBoardState>
{
  DashBoardCubit() : super(DashBoardInitialState());

  static DashBoardCubit get(context) => BlocProvider.of(context);

  DeliveryMethodsResponse? deliveryMethodsResponse;
  List<DeliveryMethodsResponse>? deliveryMethodsResponseList;
  getDeliveryMethods() {
    emit(getDeliveryMethodsLoadingState());
    ApiManager.getData(url: 'Orders/deliveryMethods',token: CacheHelper.getData(key: 'token'))
        .then((response) {
      final List<dynamic> responseData = response.data;
      deliveryMethodsResponseList = responseData
          .map((json) => DeliveryMethodsResponse.fromJson(json))
          .toList();
      emit(getDeliveryMethodsLoadedState());
    }).catchError((error) {
      emit(getDeliveryMethodsErrorState(error));
      print(error.toString());
    });
  }

  AllProducts? allProducts;
  void getAdminAllProduct({String sort = 'name'}) {
    emit(AdminAllProductLoadingState());
    ApiManager.getData(
        url: 'Product',
        query: {
          'sort': sort,
          'isDesigned': 'false',
          'PageIndex': '1',
          'PageSize': '9',
        },
        token: CacheHelper.getData(key: 'token')
    ).then((response) {
      allProducts = AllProducts.fromJson(response.data);
      print('==================================================');
      print(allProducts!.data!.length);
      print('==================================================');
      emit(AdminAllProductLoadedState());
      // if (response.data == null) {
      //   emit(AllProductErrorState("Oops! no results!"));
      // }
    }).catchError((error) {
      print(error.toString());
      emit(AdminAllProductErrorState(error.toString()));
    });
  }
  void getAdminAllProductDesigned({String sort = 'name'}) {
    emit(AdminAllProductLoadingState());
    ApiManager.getData(
        url: 'Product',
        query: {
          'sort': sort,
          'isDesigned': 'true',
          'PageIndex': '1',
          'PageSize': '9',
        },
        token: CacheHelper.getData(key: 'token')
    ).then((response) {
      allProducts = AllProducts.fromJson(response.data);
      print('==================================================');
      print(allProducts!.data!.length);
      print('==================================================');
      emit(AdminAllProductLoadedState());
      // if (response.data == null) {
      //   emit(AllProductErrorState("Oops! no results!"));
      // }
    }).catchError((error) {
      print(error.toString());
      emit(AdminAllProductErrorState(error.toString()));
    });
  }
  void deleteProduct(String productId){
    ApiManager.deleteData(url: 'Product/$productId');
    getAdminAllProductDesigned();
  }
}