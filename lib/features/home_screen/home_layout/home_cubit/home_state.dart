import 'package:g_p_app/data/model/response/ChangePasswordModel.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/product_view_widget.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/model/response/AllProductResponse.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class AllProductInitialState extends HomeState {}

class AllProductLoadingState extends HomeState {}

class AllProductLoadedState extends HomeState {}

class AllProductErrorState extends HomeState {
  final String errorMessage;

  AllProductErrorState(this.errorMessage);
}

class BestSellingProductsInitialState extends HomeState {}

class BestSellingProductsLoadingState extends HomeState {}

class BestSellingProductsLoadedState extends HomeState {}

class BestSellingProductsErrorState extends HomeState {
  final String errorMessage;

  BestSellingProductsErrorState(this.errorMessage);
}

class NewArrivalProductLoadingState extends HomeState {}

class NewArrivalProductLoadedState extends HomeState {}

class NewArrivalProductErrorState extends HomeState {
  final String errorMessage;

  NewArrivalProductErrorState(this.errorMessage);
}

class GenderProductByTypeIdLoadingState extends HomeState {}

class GenderProductByTypeIdLoadedState extends HomeState {}

class GenderProductByTypeIdErrorState extends HomeState {
  final String errorMessage;

  GenderProductByTypeIdErrorState(this.errorMessage);
}

class LogosInitialState extends HomeState {}

class LogosLoadingState extends HomeState {}

class LogosLoadedState extends HomeState {}

class LogosErrorState extends HomeState {
  final String errorMessage;

  LogosErrorState(this.errorMessage);
}

class WishListLoadingState extends HomeState {}

class WishListLoadedState extends HomeState {}

class WishListErrorState extends HomeState {
  final String errorMessage;

  WishListErrorState(this.errorMessage);
}

class UpdateWishListLoadingState extends HomeState {}

class UpdateWishListLoadedState extends HomeState {}

class UpdateWishListErrorState extends HomeState {
  final String errorMessage;

  UpdateWishListErrorState(this.errorMessage);
}

class DeleteWishlistItemLoadedState extends HomeState {}


class CartLoadingState extends HomeState {}
class CartLoadedState extends HomeState {}
class CartErrorState extends HomeState {
  final String errorMessage;
  CartErrorState(this.errorMessage);
}
class UpdateCartLoadingState extends HomeState {}
class UpdateCartLoadedState extends HomeState {}
class UpdateCartErrorState extends HomeState {
  final String errorMessage;
  UpdateCartErrorState(this.errorMessage);
}

class DeleteCartItemLoadedState extends HomeState {}

class CreateReviewLoading extends HomeState{}
class CreateReviewLoaded extends HomeState{}
class CreateReviewError extends HomeState{}

class LogoImagePickedSuccessState extends HomeState
{
  final XFile image;

  LogoImagePickedSuccessState(this.image);
}
class LogoImagePickedErrorState extends HomeState{}
class ImagePickerLoading extends HomeState{}
class ImagePickerInitial extends HomeState{}

class UserAddressLoading extends HomeState{}
class UserAddressLoaded extends HomeState{}
class UserAddressError extends HomeState{}

class ChangePasswordLoading extends HomeState{}
class ChangePasswordSuccess extends HomeState{
  ChangePasswordResponse passwordResponse;

  ChangePasswordSuccess(this.passwordResponse);
}
class ChangePasswordError extends HomeState{
  final String errorMessage;
  ChangePasswordError(this.errorMessage);
}

class ForgetPasswordLoading extends HomeState{}
class ForgetPasswordSuccess extends HomeState{}
class ForgetPasswordError extends HomeState{
  final String errorMessage;
  ForgetPasswordError(this.errorMessage);
}

class ResetPasswordLoading extends HomeState{}
class ResetPasswordSuccess extends HomeState{}
class ResetPasswordError extends HomeState{
  final String errorMessage;
  ResetPasswordError(this.errorMessage);
}
