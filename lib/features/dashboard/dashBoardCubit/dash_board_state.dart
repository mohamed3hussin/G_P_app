abstract class DashBoardState{}
class DashBoardInitialState extends DashBoardState {}
class getDeliveryMethodsLoadedState extends DashBoardState{}
class getDeliveryMethodsLoadingState extends DashBoardState{}
class getDeliveryMethodsErrorState extends DashBoardState
{
  final String errorMessage;

  getDeliveryMethodsErrorState(this.errorMessage);

}

class AdminAllProductLoadingState extends DashBoardState{}
class AdminAllProductLoadedState extends DashBoardState{}
class AdminAllProductErrorState extends DashBoardState
{
  final String errorMessage;

  AdminAllProductErrorState(this.errorMessage);

}
class AdminDeleteLoadedState extends DashBoardState{}
class AdminDeleteErrorState extends DashBoardState{}

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