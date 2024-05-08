import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/core/cach_helper/cach_helper.dart';
import 'package:g_p_app/data/model/response/AllProductResponse.dart';
import 'package:g_p_app/data/model/response/WishListModel.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/api/api_manager.dart';
import '../../../../data/model/response/CartResponse.dart';
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
  List<WishListItem>? listWishList;
  CartResponse? cartResponse;
  CartResponse? updateCartModel;
  List<CartItems>? listCartItems;
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
      allProducts = AllProducts.fromJson(response.data);
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
      newArrival = AllProducts.fromJson(response.data);
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

  void getGenderProductByTypeId(
      {required String typeId, required String gender, String isDesigned = 'false'}) {
    listProductsByGender = [];
    emit(GenderProductByTypeIdLoadingState());
    ApiManager.getData(
      url: 'Product',
      query: {
        'sort': 'name',
        'typeId': typeId,
        'gendertype': gender,
        'isDesigned': isDesigned,
        'PageIndex': '1',
        'PageSized': '3',
      },
    ).then((response) {
      productsByGender = AllProducts.fromJson(response.data);
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

  void getWishList() {
    emit(WishListLoadingState());
    ApiManager.getData(
        url: 'Wishlists/{id}',
        query:
        {
          'Wishlistid': 'wishlist1',
        }).then((value) {
      wishListModel = WishListModel.fromJson(value.data);
      emit(WishListLoadedState());
    }).catchError((error) {
      print(error.toString());
      emit(WishListErrorState(error.toString()));
    });
  }

  void updateWishList({required Map<String, dynamic> data}) async {
    emit(UpdateWishListLoadingState());
    try {
      final response = await ApiManager.postData(
        url: 'Wishlists', // Adjust the URL according to your API
        data: data,
      );
      // Parse the response to get the updated wish list model
      updateWishListModel = WishListModel.fromJson(response.data);
      listWishList ??= [];
      for (var newItem in updateWishListModel!.items) {
        if (!listWishList!.any((existingItem) =>
        existingItem.id == newItem.id)) {
          // If the item doesn't exist in listWishList, add it
          listWishList!.add(newItem);
        }
      }
      saveWishListToPrefs();
      // Notify the UI that the operation is completed
      emit(UpdateWishListLoadedState());
    } catch (error) {
      // Handle any errors that occur during the process
      print(error.toString());
      emit(UpdateWishListErrorState(error.toString()));
    }
  }

  void deleteWishlistItem(WishListItem model) {
    listWishList?.remove(model);
    getWishList();
    saveWishListToPrefs();
    print(listWishList?.length);
    emit(DeleteWishlistItemLoadedState());
  }

  void saveWishListToPrefs() {
    List<String> wishListJsonList = listWishList!.map((item) =>
        jsonEncode(item.toJson())).toList();
    print(listWishList);
    print(wishListJsonList[0]);
    print(wishListJsonList);
    CacheHelper.sharedPreferences.setStringList('wishlist', wishListJsonList);
  }

  getWishListFromPrefs() {
    List<String>? wishListJsonList = CacheHelper.sharedPreferences
        .getStringList('wishlist');
    if (wishListJsonList != null) {
      listWishList = wishListJsonList.map((jsonString) =>
          WishListItem.fromJson(jsonDecode(jsonString))).toList();
    }
  }

  void getCart() {
    emit(CartLoadingState());
    ApiManager.getData(
        url: 'Baskets/1',
        query:
        {
          'BasketId': 'basket1',
        }).then((value) {
      cartResponse = CartResponse.fromJson(value.data);
      emit(CartLoadedState());
    }).catchError((error) {
      print(error.toString());
      emit(CartErrorState(error.toString()));
    });
  }

  void updateCart(
      {required Map<String, dynamic> data, int quantity = 1}) async {
    emit(UpdateCartLoadingState());
    try {
      final response = await ApiManager.postData(
        url: 'Baskets',
        data: data,
      );
      // Parse the response to get the updated wish list model
      updateCartModel = CartResponse.fromJson(response.data);
      listCartItems ??= [];
      for (var newItem in updateCartModel!.items!) {
        var existingItem = listCartItems!.firstWhereOrNull((item) =>
        item.id == newItem.id);
        if (existingItem != null) {
          // If the item already exists in the cart, update its quantity
          existingItem.quantity = existingItem.quantity! + quantity;
        } else {
          // If the item doesn't exist in the cart, add it
          listCartItems!.add(newItem);
        }
      }
      saveCartToPrefs();
      // Notify the UI that the operation is completed
      emit(UpdateCartLoadedState());
    } catch (error) {
      // Handle any errors that occur during the process
      print(error.toString());
      emit(UpdateCartErrorState(error.toString()));
    }
  }

  void saveCartToPrefs() {
    List<String> cartJsonList = listCartItems!.map((item) =>
        jsonEncode(item.toJson())).toList();
    print(listCartItems);
    CacheHelper.sharedPreferences.setStringList('cart', cartJsonList);
  }

  getCartFromPrefs() {
    List<String>? cartJsonList = CacheHelper.sharedPreferences
        .getStringList('cart');
    if (cartJsonList != null) {
      listCartItems = cartJsonList.map((jsonString) =>
          CartItems.fromJson(jsonDecode(jsonString))).toList();
    }
  }


  void deleteCartItem(CartItems model) {
    listCartItems?.remove(model);
    getCart();
    saveCartToPrefs();
    print(listCartItems?.length);
    emit(DeleteCartItemLoadedState());
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