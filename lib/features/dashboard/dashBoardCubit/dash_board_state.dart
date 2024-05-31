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
