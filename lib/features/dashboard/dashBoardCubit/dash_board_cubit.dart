import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/features/dashboard/dashBoardCubit/dash_board_state.dart';

import '../../../core/cach_helper/cach_helper.dart';
import '../../../data/api/api_manager.dart';
import '../../../data/model/response/AllProductResponse.dart';
import '../../../data/model/response/DeliveryMethodsResponse.dart';
import '../../../data/model/response/LogoResponse.dart';

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

  AllProducts? allDesignedProducts;
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
      allDesignedProducts = AllProducts.fromJson(response.data);
      print('==================================================');
      print(allDesignedProducts!.data!.length);
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
    ApiManager.deleteData(url: 'Product/DeleteProduct/$productId',token: CacheHelper.getData(key: 'token'))
        .then((value)
    {
      emit(AdminDeleteLoadedState());
      getAdminAllProduct();
    }).catchError((error)
    {
      emit(AdminDeleteErrorState());
    });

  }

  void deleteLogo(String logoId){
    ApiManager.deleteData(url: 'Product/DeleteLogo/$logoId',token: CacheHelper.getData(key: 'token'))
        .then((value)
    {
      emit(AdminDeleteLoadedState());
      getAdminLogos();
    }).catchError((error)
    {
      emit(AdminDeleteErrorState());
    });

  }

  List<Logo>? logo;
  void getAdminLogos() {
    emit(AdminLogosLoadingState());
    ApiManager.getData(
        url: 'Product/Logo', token: CacheHelper.getData(key: 'token'))
        .then((response) {
      List<dynamic> data = response.data;
      logo = data.map((json) => Logo.fromJson(json)).toList();
      emit(AdminLogosLoadedState());
      // if (response.data == null) {
      //   emit(BestSellingProductsErrorState("Oops! no results!"));
      // }
    }).catchError((error) {
      print(error.toString());
      emit(AdminLogosErrorState(error.toString()));
    });
  }

  postData(Map<String, dynamic> body)async{
    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap(body);
      var response = await dio.post(
          'https://e684-196-132-75-85.ngrok-free.app/api/Product',
          data: formData,
          options: Options(
            headers: {
              'Content-Type':'multipart/form-data',
              'lang':'en',
              'Authorization':CacheHelper.getData(key: 'token'),
            },
            followRedirects: true,
            validateStatus: (status) {
              return status! < 500; // Accept status codes less than 500
            },
          ),
      );

      print(response.data);
      if (response.statusCode == 200) {
        print('File uploaded successfully');
        getAdminAllProduct();
        getAdminAllProductDesigned();
      } else {
        print('File upload failed: ${response.statusCode}');
      }
      return response.data;

    } catch (e) {
      print(e);
    }
  }
  createLogo(Map<String, dynamic> body)async{
    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap(body);
      var response = await dio.post(
        'https://e684-196-132-75-85.ngrok-free.app/api/Product/CreateLogo',
        data: formData,
        options: Options(
          headers: {
            'Content-Type':'multipart/form-data',
            'lang':'en',
            'Authorization':CacheHelper.getData(key: 'token'),
          },
          followRedirects: true,
          validateStatus: (status) {
            return status! < 500; // Accept status codes less than 500
          },
        ),
      );

      print(response.data);
      if (response.statusCode == 200) {
        print('File uploaded successfully');
        getAdminLogos();
      } else {
        print('File upload failed: ${response.statusCode}');
      }
      return response.data;

    } catch (e) {
      print(e);
    }
  }

  editProduct(String productId,Map<String, dynamic> body)async{
    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap(body);
      var response = await dio.put(
        'https://e684-196-132-75-85.ngrok-free.app/api/Product/$productId',
        data: formData,
        options: Options(
          headers: {
            'Content-Type':'multipart/form-data',
            'lang':'en',
            'Authorization':CacheHelper.getData(key: 'token'),
          },
          followRedirects: true,
          validateStatus: (status) {
            return status! < 500; // Accept status codes less than 500
          },
        ),
      );

      print(response.data);
      if (response.statusCode == 200) {
        print('File uploaded successfully');
        getAdminAllProduct();
      } else {
        print('File upload failed: ${response.statusCode}');
      }
      return response.data;

    } catch (e) {
      print(e);
    }
  }

  editDesignProduct(String productId,Map<String, dynamic> body)async{
    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap(body);
      var response = await dio.put(
        'https://e684-196-132-75-85.ngrok-free.app/api/Product/$productId',
        data: formData,
        options: Options(
          headers: {
            'Content-Type':'multipart/form-data',
            'lang':'en',
            'Authorization':CacheHelper.getData(key: 'token'),
          },
          followRedirects: true,
          validateStatus: (status) {
            return status! < 500; // Accept status codes less than 500
          },
        ),
      );

      print(response.data);
      if (response.statusCode == 200) {
        print('File uploaded successfully');
        getAdminAllProductDesigned();
      } else {
        print('File upload failed: ${response.statusCode}');
      }
      return response.data;

    } catch (e) {
      print(e);
    }
  }

  editLogo(String logoId,Map<String, dynamic> body)async{
    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap(body);
      var response = await dio.post(
        'https://e684-196-132-75-85.ngrok-free.app/api/Product/UpdateLogo/$logoId',
        data: formData,
        options: Options(
          headers: {
            'Content-Type':'multipart/form-data',
            'lang':'en',
            'Authorization':CacheHelper.getData(key: 'token'),
          },
          followRedirects: true,
          validateStatus: (status) {
            return status! < 500; // Accept status codes less than 500
          },
        ),
      );

      print(response.data);
      if (response.statusCode == 200) {
        print('File uploaded successfully');
        getAdminLogos();
      } else {
        print('File upload failed: ${response.statusCode}');
      }
      return response.data;

    } catch (e) {
      print(e);
    }
  }
}