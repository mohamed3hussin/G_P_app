
abstract class DashboardState{}

class DashboardInitialState extends DashboardState {}
class DeliveryMethodsLoadedState extends DashboardState{}
class DeliveryMethodsLoadingState extends DashboardState{}
class DeliveryMethodsErrorState extends DashboardState
{
  final String errorMessage;

  DeliveryMethodsErrorState(this.errorMessage);

}

class AdminAllProductLoadingState extends DashboardState{}
class AdminAllProductLoadedState extends DashboardState{}
class AdminAllProductErrorState extends DashboardState
{
  final String errorMessage;

  AdminAllProductErrorState(this.errorMessage);

}

class AdminLogosLoadingState extends DashboardState{}
class AdminLogosLoadedState extends DashboardState{}
class AdminLogosErrorState extends DashboardState
{
  final String errorMessage;

  AdminLogosErrorState(this.errorMessage);
}

class AddProductLoadedState extends DashboardState{}
class AddProductErrorState extends DashboardState
{
  final String errorMessage;

  AddProductErrorState(this.errorMessage);
}

class AddLogoLoadedState extends DashboardState{}
class AddLogoErrorState extends DashboardState
{
  final String errorMessage;

  AddLogoErrorState(this.errorMessage);
}

class EditProductSuccessState extends DashboardState{}
class EditProductErrorState extends DashboardState
{
  final String errorMessage;

  EditProductErrorState(this.errorMessage);
}

class EditLogoSuccessState extends DashboardState{}
class EditLogoErrorState extends DashboardState
{
  final String errorMessage;

  EditLogoErrorState(this.errorMessage);
}

class AdminDeleteLoadedState extends DashboardState{}
class AdminDeleteErrorState extends DashboardState{}