import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cache_helper/cache_helper.dart';
import '../../../../data/api/api_manager.dart';
import '../../../../data/model/response/AllProductResponse.dart';
import '../../../../data/model/response/DeliveryMethodsResponse.dart';
import '../../../../data/model/response/LogoResponse.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState>
{
  DashboardCubit() : super(DashboardInitialState());

  static DashboardCubit get(context) => BlocProvider.of(context);

  DeliveryMethodsResponse? deliveryMethodsResponse;
  List<DeliveryMethodsResponse>? deliveryMethodsResponseList;
  AllProducts? allProducts;
  AllProducts? allDesignedProducts;
  List<Logo>? logo;

///get admin dashboard functions:-

  getDeliveryMethods() {
    emit(DeliveryMethodsLoadingState());
    ApiManager.getData(url: 'Orders/deliveryMethods',token: CacheHelper.getData(key: 'token'))
        .then((response) {
      final List<dynamic> responseData = response.data;
      deliveryMethodsResponseList = responseData
          .map((json) => DeliveryMethodsResponse.fromJson(json))
          .toList();
      emit(DeliveryMethodsLoadedState());
    }).catchError((error) {
      emit(DeliveryMethodsErrorState(error));
      print(error.toString());
    });
  }

  getAdminAllProduct({String sort = 'name'}) {
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
      emit(AdminAllProductLoadedState());
    }).catchError((error) {
      emit(AdminAllProductErrorState(error.toString()));
    });
  }

  getAdminAllProductDesigned({String sort = 'name'}) {
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
      emit(AdminAllProductLoadedState());
    }).catchError((error) {
      print(error.toString());
      emit(AdminAllProductErrorState(error.toString()));
    });
  }

  getAdminLogos() {
    emit(AdminLogosLoadingState());
    ApiManager.getData(
        url: 'Product/Logo', token: CacheHelper.getData(key: 'token'))
        .then((response) {
      List<dynamic> data = response.data;
      logo = data.map((json) => Logo.fromJson(json)).toList();
      emit(AdminLogosLoadedState());
    }).catchError((error) {
      print(error.toString());
      emit(AdminLogosErrorState(error.toString()));
    });
  }



///create admin dashboard functions:-

  postData(Map<String, dynamic> body)async{
    var dio = Dio();
    try {
      FormData formData = FormData.fromMap(body);
      var response = await dio.post(
          'https://1a54-41-233-199-23.ngrok-free.app/api/Product',
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
        emit(AddProductLoadedState());
      } else {
        print('File upload failed: ${response.statusCode}');
        emit(AddProductErrorState(response.statusMessage??''));
      }
      return response.data;

    } catch (e) {
      emit(AddProductErrorState(e.toString()));
      print(e.toString());
    }
  }

  createLogo(Map<String, dynamic> body)async{
    var dio = Dio();
    try {
      FormData formData = FormData.fromMap(body);
      var response = await dio.post(
        'https://1a54-41-233-199-23.ngrok-free.app/api/Product/CreateLogo',
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
        emit(AddLogoLoadedState());
        getAdminLogos();
      } else {
        print('File upload failed: ${response.statusCode}');
        emit(AddLogoErrorState(response.statusMessage??''));
      }
      return response.data;

    } catch (e) {
      print(e);
      emit(AddLogoErrorState(e.toString()));
    }
  }



///edit admin dashboard functions:-

  editProduct(String productId,Map<String, dynamic> body)async{
    var dio = Dio();
    try {
      FormData formData = FormData.fromMap(body);
      var response = await dio.put(
        'https://1a54-41-233-199-23.ngrok-free.app/api/Product/$productId',
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
        emit(EditProductSuccessState());
      } else {
        print('File upload failed: ${response.statusCode}');
        emit(EditProductErrorState(response.statusMessage??''));
      }
      return response.data;

    } catch (e) {
      print(e.toString());
      emit(EditProductErrorState(e.toString()));
    }
  }

  editDesignProduct(String productId,Map<String, dynamic> body)async{
    var dio = Dio();
    try {
      FormData formData = FormData.fromMap(body);
      var response = await dio.put(
        'https://1a54-41-233-199-23.ngrok-free.app/api/Product/$productId',
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
        emit(EditProductSuccessState());
      } else {
        print('File upload failed: ${response.statusCode}');
        emit(EditProductErrorState(response.statusMessage??''));
      }
      return response.data;

    } catch (e) {
      print(e.toString());
      emit(EditProductErrorState(e.toString()));

    }
  }

  editLogo(String logoId,Map<String, dynamic> body)async{
    var dio = Dio();
    try {
      FormData formData = FormData.fromMap(body);
      var response = await dio.put(
        'https://1a54-41-233-199-23.ngrok-free.app/api/Product/UpdateLogo/$logoId',
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
        emit(EditLogoSuccessState());
      } else {
        print('File upload failed: ${response.statusCode}');
        emit(EditLogoErrorState(response.statusMessage??''));
      }
      return response.data;

    } catch (e) {
      print(e.toString());
      emit(EditLogoErrorState(e.toString()));

    }
  }



///delete admin dashboard functions:-

  deleteProduct(String productId){
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

  deleteLogo(String logoId){
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


}