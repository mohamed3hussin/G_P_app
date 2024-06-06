import 'dart:convert';
import 'dart:io';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/core/cach_helper/cach_helper.dart';
import 'package:g_p_app/data/model/response/AddressResponse.dart';
import 'package:g_p_app/data/model/response/AllOrdersResponse.dart';
import 'package:g_p_app/data/model/response/AllProductResponse.dart';
import 'package:g_p_app/data/model/response/UserAddress.dart';
import 'package:g_p_app/data/model/response/WishListModel.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../data/api/api_manager.dart';
import '../../../../data/model/response/CartResponse.dart';
import '../../../../data/model/response/ChangePasswordModel.dart';
import '../../../../data/model/response/DeliveryMethodsResponse.dart';
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
  CartResponse? paymentIntent;
  UserAddressResponse? userAddress;
  List<AllOrdersResponse>? allOrdersResponse;
  int deliveryMethodId = 1;
  Map<String, dynamic>? userAddressCheckOut;
  AllProducts? searchResults;

  void getAllProduct({String sort = 'name'}) {
    emit(AllProductLoadingState());
    ApiManager.getData(
            url: 'Product',
            query: {
              'sort': sort,
              'isDesigned': 'false',
              'PageIndex': '1',
              'PageSized': '8',
            },
            token: CacheHelper.getData(key: 'token'))
        .then((response) {
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
              'PageSize': '7',
            },
            token: CacheHelper.getData(key: 'token'))
        .then((response) {
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
            token: CacheHelper.getData(key: 'token'))
        .then((response) {
      final List<dynamic> responseData = response.data;
      bestSelling = responseData.map((json) => Data.fromJson(json)).toList();
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
      {required String typeId,
      required String gender,
      String isDesigned = 'false'}) {
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
            token: CacheHelper.getData(key: 'token'))
        .then((response) {
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

  void getLogos() {
    emit(LogosLoadingState());
    ApiManager.getData(
            url: 'Product/Logo', token: CacheHelper.getData(key: 'token'))
        .then((response) {
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

  void getWishList() {
    emit(WishListLoadingState());
    ApiManager.getData(
            url: 'Wishlists/{id}',
            query: {
              'Wishlistid': 'wishlist1',
            },
            token: CacheHelper.getData(key: 'token'))
        .then((value) {
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
          token: CacheHelper.getData(key: 'token'));
      // Parse the response to get the updated wish list model
      updateWishListModel = WishListModel.fromJson(response.data);
      listWishList ??= [];
      for (var newItem in updateWishListModel!.items) {
        if (!listWishList!
            .any((existingItem) => existingItem.id == newItem.id)) {
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
    emit(DeleteWishlistItemLoadedState());
  }

  void saveWishListToPrefs() {
    List<String> wishListJsonList =
        listWishList!.map((item) => jsonEncode(item.toJson())).toList();
    print(listWishList);
    print(wishListJsonList);
    CacheHelper.sharedPreferences.setStringList('wishlist', wishListJsonList);
  }

  getWishListFromPrefs() {
    List<String>? wishListJsonList =
        CacheHelper.sharedPreferences.getStringList('wishlist');
    if (wishListJsonList != null) {
      listWishList = wishListJsonList
          .map((jsonString) => WishListItem.fromJson(jsonDecode(jsonString)))
          .toList();
    }
  }

  void getCart() {
    emit(CartLoadingState());
    ApiManager.getData(
            url: 'Baskets/1',
            query: {
              'BasketId': 'basket1',
            },
            token: CacheHelper.getData(key: 'token'))
        .then((value) {
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
          url: 'Baskets', data: data, token: CacheHelper.getData(key: 'token'));
      // Parse the response to get the updated wish list model
      updateCartModel = CartResponse.fromJson(response.data);
      listCartItems ??= [];
      for (var newItem in updateCartModel!.items!) {
        var existingItem =
            listCartItems!.firstWhereOrNull((item) => item.id == newItem.id);
        if (existingItem != null) {
          // If the item already exists in the cart, update its quantity
          existingItem.quantity = existingItem.quantity! + quantity;
        } else {
          // If the item doesn't exist in the cart, add it
          listCartItems!.add(newItem);
        }
      }
      saveCartToPrefs();
      convertCartToJson();
      // Notify the UI that the operation is completed
      emit(UpdateCartLoadedState());
    } catch (error) {
      // Handle any errors that occur during the process
      print(error.toString());
      emit(UpdateCartErrorState(error.toString()));
    }
  }

  void saveCartToPrefs() {
    List<String> cartJsonList =
        listCartItems!.map((item) => jsonEncode(item.toJson())).toList();
    print(listCartItems);
    CacheHelper.sharedPreferences.setStringList('cart', cartJsonList);
  }

  getCartFromPrefs() {
    List<String>? cartJsonList =
        CacheHelper.sharedPreferences.getStringList('cart');
    if (cartJsonList != null) {
      listCartItems = cartJsonList
          .map((jsonString) => CartItems.fromJson(jsonDecode(jsonString)))
          .toList();
    }
  }

  deleteCartFromPref() {
    CacheHelper.sharedPreferences.remove('cart');
  }

  void deleteCartItem(CartItems model) {
    listCartItems?.remove(model);
    getCart();
    saveCartToPrefs();
    print(listCartItems?.length);
    emit(DeleteCartItemLoadedState());
  }

  void updateDeliveryMethodId(int id) async {
    deliveryMethodId = id;
  }

  buyNowForPayment(Map<String, dynamic> data,
      {int deliveryMethodId = 1}) async {
    // Create a temporary cart for the "Buy Now" item
    await ApiManager.postData(
      url: 'Baskets',
      data: {
        'id': 'temp_basket',
        'items': [
          {
            'id': data['id'],
            'productName': data['productName'],
            'pictureUrl': data['pictureUrl'],
            'size': data['size'],
            'color': data['color'],
            'price': data['price'],
            'quantity': data['quantity'],
          }
        ],
        'deliveryMethodId': deliveryMethodId,
      },
      token: CacheHelper.getData(key: 'token'),
    ).then((value) async {
      final response = CartResponse.fromJson(value.data);
      await createPaymentIntent(orderId: 'temp_basket');
    });
  }

  List<Map<String, dynamic>>? convertCartToJson() {
    if (listCartItems != null) {
      List<Map<String, dynamic>> jsonData = [];
      for (var item in listCartItems!) {
        jsonData.add({
          'id': item.id,
          'productName': item.productName,
          'pictureUrl': item.pictureUrl,
          'size': item.size,
          'color': item.color,
          'price': item.price,
          'quantity': item.quantity,
        });
      }
      return jsonData;
    } else {
      return null;
    }
  }

  createCartForPayment({int deliveryMethodId = 1}) async {
    List<Map<String, dynamic>>? jsonData = convertCartToJson();
    ApiManager.postData(
            url: 'Baskets',
            data: {
              'id': 'basket1',
              'items': jsonData,
              'deliveryMethodId': deliveryMethodId,
            },
            token: CacheHelper.getData(key: 'token'))
        .then((value) {
      final response = CartResponse.fromJson(value.data);
      createPaymentIntent();
    });
  }

  createPaymentIntent({String orderId = 'basket1'}) {
    final response = ApiManager.postData(
            url: 'Payment/$orderId',
            data: {},
            token: CacheHelper.getData(key: 'token'))
        .then((value) {
      paymentIntent = CartResponse.fromJson(value.data);
      print(paymentIntent?.paymentIntentId);
      print(paymentIntent?.clilentSecret);
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  getCurrentUserAddress() {
    emit(UserAddressLoading());
    ApiManager.getData(
            url: 'accounts/Address', token: CacheHelper.getData(key: 'token'))
        .then((response) {
      userAddressCheckOut = response.data;
      print(userAddressCheckOut);
      userAddress = UserAddressResponse.fromJson(response.data);
      emit(UserAddressLoaded());
    }).catchError((error) {
      print(error.toString());
      emit(UserAddressError());
    });
  }

  updateUserAddress(
      {required String Fname,
      required String Lname,
      required String street,
      required String city,
      required String country,
      required String postalCode,
      required Function onSuccess}) {
    ApiManager.updateData(
        url: 'accounts/UpdateAddress',
        token: CacheHelper.getData(key: 'token'),
        data: {
          "firstName": Fname,
          "lName": Lname,
          "street": street,
          "city": city,
          "country": country,
          "postalCode": postalCode
        }).then((value) {
      userAddressCheckOut = {
        "firstName": Fname,
        "lName": Lname,
        "street": street,
        "city": city,
        "country": country,
        "postalCode": postalCode
      };
      final response = AddressResponse.fromJson(value.data);
      getCurrentUserAddress();
      onSuccess();
    });
  }

  getUserOrders() {
    ApiManager.getData(url: 'Orders', token: CacheHelper.getData(key: 'token'))
        .then((response) {
      final List<dynamic> responseData = response.data;
      allOrdersResponse =
          responseData.map((json) => AllOrdersResponse.fromJson(json)).toList();
    });
  }

  createReview({required int rate, required int id, required String comment}) {
    emit(CreateReviewLoading());
    ApiManager.postData(
            url: 'Product/CreateReview',
            data: {'Rate': rate, 'ProductId': id, 'Comments': comment},
            token: CacheHelper.getData(key: 'token'))
        .then((value) {
      emit(CreateReviewLoaded());
      getAllProduct();
      getNewArrivalProduct();
      getBestSellingProduct();
    }).catchError((error) {
      emit(CreateReviewError());
      print(error.toString());
    });
  }

  XFile? uploadLogo;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    try {
      emit(ImagePickerLoading());
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        uploadLogo = image.path as XFile?;
        emit(LogoImagePickedSuccessState(image));
      } else {
        emit(ImagePickerInitial());
      }
    } catch (e) {
      emit(LogoImagePickedErrorState());
    }
  }

  createCheckOut(String basketId) {
    ApiManager.postData(
            url: 'Orders',
            data: {
              "buyerEmail": CacheHelper.getData(key: 'email'),
              "basketId": basketId,
              "deliveryMethodId": 1,
              "shippingAddress": userAddressCheckOut
            },
            token: CacheHelper.getData(key: 'token'))
        .then((value) {
      print(value.data);
    });
  }

  void getSearch({String sort = 'name', required String search}) {
    ApiManager.getData(
            url: 'Product',
            query: {
              'sort': sort,
              'isDesigned': 'false',
              'PageIndex': '1',
              'PageSized': '3',
              'search': search
            },
            token: CacheHelper.getData(key: 'token'))
        .then((response) {
      searchResults = AllProducts.fromJson(response.data);
      //emit(AllProductLoadedState());
    }).catchError((error) {
      print(error.toString());
      //emit(AllProductErrorState(error.toString()));
    });
  }

  void changePassword(
      {required String currentPassword, required String newPassword}) {
    emit(ChangePasswordLoading());
    ApiManager.postData(
      url: 'accounts/ChangePassword',
      data: ChangePasswordRequest(
              currentPassword: currentPassword, newPassword: newPassword)
          .toJson(),
    ).then((value) {
      final response = ChangePasswordResponse.fromJson(value.data);
      emit(ChangePasswordSuccess(response));
    }).catchError((error) {
      emit(ChangePasswordError(error.toString()));
      print(error.toString());
    });
  }

  String? forgotPasswordToken;
  String? forgotPasswordEmail;

  void forgotPassword(String email) async {
    emit(ForgetPasswordLoading());
    ApiManager.postData(
        url: 'accounts/ForgotPassword',
        data: {},
        query: {'email': email}).then((response) {
      final data = response.data;
      final resetLink = data['resetPasswordUrl'];
      final uri = Uri.parse(resetLink);
      final token = uri.queryParameters['token'];
      print(token);
      forgotPasswordEmail = email;
      forgotPasswordToken = token;
      emit(ForgetPasswordSuccess());
    }).catchError((onError) {
      emit(ForgetPasswordError(onError.toString()));
      print(onError.toString());
    });
  }

  void resetPassword(String newPassword) {
    emit(ResetPasswordLoading());
    Map<String,dynamic> body={
      'NewPassword':newPassword
    };
    FormData formData = FormData.fromMap(body);

    ApiManager.postFormData(url: 'accounts/ResetPassword', data: formData,query: {
      'email':forgotPasswordEmail,
      'token':forgotPasswordToken
    }).then((value) {
      print("password have been reset successfully");
      emit(ResetPasswordSuccess());
    }).catchError((onError) {
      emit(ResetPasswordError(onError.toString()));
      print('=====================');
      print(onError.toString());
      print('=====================');
    });
  }
}
