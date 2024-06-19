import 'package:g_p_app/features/dashboard/widget/add_logo.dart';

abstract class DashBoardState{}

class DashBoardInitialState extends DashBoardState {}
class DeliveryMethodsLoadedState extends DashBoardState{}
class DeliveryMethodsLoadingState extends DashBoardState{}
class DeliveryMethodsErrorState extends DashBoardState
{
  final String errorMessage;

  DeliveryMethodsErrorState(this.errorMessage);

}

class AdminAllProductLoadingState extends DashBoardState{}
class AdminAllProductLoadedState extends DashBoardState{}
class AdminAllProductErrorState extends DashBoardState
{
  final String errorMessage;

  AdminAllProductErrorState(this.errorMessage);

}

class AdminLogosLoadingState extends DashBoardState{}
class AdminLogosLoadedState extends DashBoardState{}
class AdminLogosErrorState extends DashBoardState
{
  final String errorMessage;

  AdminLogosErrorState(this.errorMessage);
}

class AddProductLoadedState extends DashBoardState{}
class AddProductErrorState extends DashBoardState
{
  final String errorMessage;

  AddProductErrorState(this.errorMessage);
}

class AddLogoLoadedState extends DashBoardState{}
class AddLogoErrorState extends DashBoardState
{
  final String errorMessage;

  AddLogoErrorState(this.errorMessage);
}

class EditProductSuccessState extends DashBoardState{}
class EditProductErrorState extends DashBoardState
{
  final String errorMessage;

  EditProductErrorState(this.errorMessage);
}

class EditLogoSuccessState extends DashBoardState{}
class EditLogoErrorState extends DashBoardState
{
  final String errorMessage;

  EditLogoErrorState(this.errorMessage);
}

class AdminDeleteLoadedState extends DashBoardState{}
class AdminDeleteErrorState extends DashBoardState{}