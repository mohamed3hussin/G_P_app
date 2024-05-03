import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/core/cach_helper/cach_helper.dart';
import 'package:g_p_app/data/model/response/AllProductResponse.dart';
import 'package:g_p_app/data/model/response/WishListModel.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import '../../../../data/api/api_manager.dart';
import '../../../../data/model/response/LogoResponse.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  AllProducts? allProducts;
  AllProducts? newArrival;
  List<Data>? bestSelling;
  AllProducts? productsByGender;
  List<Data>? listProductsByGender;
  WishListModel? wishListModel;
  WishListModel? updateWishListModel;
  List<Logo>? logo;

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
    ).then((response) {
      allProducts=AllProducts.fromJson(response.data);
      emit(AllProductLoadedState());
      // if (response.data == null) {
      //   emit(AllProductErrorState("Oops! no results!"));
      // }
    }).catchError((error) {
      print(error.toString());
      emit(AllProductErrorState(error.toString()));
    });
  }

  void getNewArrivalProduct() {
    emit(NewArrivalProductLoadingState());
    ApiManager.getData(
      url: 'Product',
      query: {
        'sort': 'DateOfCreation',
        'isDesigned': 'false',
        'PageIndex': '1',
        'PageSized': '3',
      },
    ).then((response) {
      newArrival=AllProducts.fromJson(response.data);
      emit(NewArrivalProductLoadedState());
      // if (response.data == null) {
      //   emit(AllProductErrorState("Oops! no results!"));
      // }
    }).catchError((error) {
      emit(NewArrivalProductErrorState(error.toString()));
    });
  }

  void getBestSellingProduct({String sort = 'name'}) {
    emit(BestSellingProductsLoadingState());
    ApiManager.getData(
      url: 'Product/BestSelling',
      query: {
        'sort': sort,
        'isDesigned': 'true',
        'PageSized': '3',
      },
    ).then((response) {
      final List<dynamic> responseData = response.data;
      bestSelling =
          responseData.map((json) => Data.fromJson(json)).toList();
      emit(BestSellingProductsLoadedState());
      // if (response.data == null) {
      //   emit(BestSellingProductsErrorState("Oops! no results!"));
      // }
    }).catchError((error) {
      print(error.toString());
      emit(BestSellingProductsErrorState(error.toString()));
    });
  }

  void getGenderProductByTypeId({required String typeId, required String gender, String isDesigned='false'}) {
    listProductsByGender=[];
    emit(GenderProductByTypeIdLoadingState());
    ApiManager.getData(
      url: 'Product',
      query: {
        'sort': 'name',
        'typeId': typeId,
        'gendertype':gender,
        'isDesigned': isDesigned,
        'PageIndex': '1',
        'PageSized': '3',
      },
    ).then((response) {
      productsByGender=AllProducts.fromJson(response.data);
      listProductsByGender?.addAll(productsByGender!.data!);
      emit(GenderProductByTypeIdLoadedState());
      // if (response.data == null) {
      //   emit(AllProductErrorState("Oops! no results!"));
      // }
    }).catchError((error) {
      print(error.toString());
      emit(GenderProductByTypeIdErrorState(error.toString()));
    });
  }
  void getWishList()
  {
    emit(WishListLoadingState());
    ApiManager.getData(
        url: 'Wishlists/{id}',
        query:
        {
          'Wishlistid':'wishlist1',
        }).then((value)
    {
      wishListModel = WishListModel.fromJson(value.data);
      print(wishListModel!.items?[0].productName);
      emit(WishListLoadedState());
    }).catchError((error){
      print(error.toString());
      emit(WishListErrorState(error.toString()));
    });
  }
  // int? id;
  // String? productName;
  // String? pictureUrl;
  // String? size;
  // String? type;
  // int? quantity;
  // double? price;
  // bool? isFavourite;
  void updateWishList(
  {
    required int productId,
    required String productName,
    required String pictureUrl,
    required String size,
    required String type,
    required int quantity,
    required double price,
    bool isFavourite =  true,
    
})
  {
    emit(UpdateWishListLoadingState());
    ApiManager.updateData(
        url: 'Wishlists',
        token: CacheHelper.getData(key: 'token'),
        data:
        {
          'id':productId,
          'productName':productName,
          'pictureUrl':pictureUrl,
          'size':size,
          'type':type,
          'quantity':quantity,
          'price':price,
          'isFavourite':isFavourite
        }).then((value)
    {
      updateWishListModel = WishListModel.fromJson(value.data);
      print('${updateWishListModel}');
      emit(UpdateWishListLoadedState());
    }).catchError((error)
    {
      UpdateWishListErrorState(error.toString());
    });
    
  }

  void getLogos() {
    emit(LogosLoadingState());
    ApiManager.getData(
      url: 'Product/Logo',
    ).then((response) {
      List<dynamic> data = response.data;
       logo = data.map((json) => Logo.fromJson(json)).toList();
       emit(LogosLoadedState());
      // if (response.data == null) {
      //   emit(BestSellingProductsErrorState("Oops! no results!"));
      // }
    }).catchError((error) {
      print(error.toString());
      emit(LogosErrorState(error.toString()));
    });
  }
}
