part of 'service_bloc.dart';

abstract class ServiceState extends Equatable {
  const ServiceState();
}

class ServiceInitial extends ServiceState {
  @override
  List<Object> get props => [];
}

class ServiceDashboardCountFetchingState extends ServiceState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServiceDashboardCountFetchedState extends ServiceState {
  final DashboardCountData dashData;

  ServiceDashboardCountFetchedState(this.dashData);

  @override
  // TODO: implement props
  List<Object?> get props => [dashData];
}

class ServiceDashboardCountErrorState extends ServiceState {
  final String message;

  ServiceDashboardCountErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class ServicePendingOrderListFetchingState extends ServiceState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServicePendingOrderListFetchedState extends ServiceState {
  final List<PendingOrderList> pendingOrderList;

  ServicePendingOrderListFetchedState(this.pendingOrderList);

  @override
  // TODO: implement props
  List<Object?> get props => [pendingOrderList];
}

class ServicePendingOrderListErrorState extends ServiceState {
  final String message;

  ServicePendingOrderListErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}


class ServiceDispatchedOrderListFetchingState extends ServiceState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServiceDispatchedOrderListFetchedState extends ServiceState {
  final List<DispatchedOrderList> dispatchedOrderList;

  ServiceDispatchedOrderListFetchedState(this.dispatchedOrderList);

  @override
  // TODO: implement props
  List<Object?> get props => [dispatchedOrderList];
}

class ServiceDispatchedOrderListErrorState extends ServiceState {
  final String message;

  ServiceDispatchedOrderListErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class ServiceDispatchedOrderDetailsFetchingState extends ServiceState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServiceDispatchedOrderDetailsFetchedState extends ServiceState {
  final DispatchedOrderData dispatchedOrderData;

  ServiceDispatchedOrderDetailsFetchedState(this.dispatchedOrderData);

  @override
  // TODO: implement props
  List<Object?> get props => [dispatchedOrderData];
}

class ServiceDispatchedOrderDetailsErrorState extends ServiceState {
  final String message;

  ServiceDispatchedOrderDetailsErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class ServiceInProcessOrderListFetchingState extends ServiceState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServiceInProcessOrderListFetchedState extends ServiceState {
  final List<InProcessList> inProcessList;

  ServiceInProcessOrderListFetchedState(this.inProcessList);

  @override
  // TODO: implement props
  List<Object?> get props => [inProcessList];
}

class ServiceInProcessOrderListErrorState extends ServiceState {
  final String message;

  ServiceInProcessOrderListErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class ServiceInProcessDetailsFetchingState extends ServiceState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServiceInProcessDetailsFetchedState extends ServiceState {
  final InProcessOrderData inProcessOrderData;

  ServiceInProcessDetailsFetchedState(this.inProcessOrderData);

  @override
  // TODO: implement props
  List<Object?> get props => [inProcessOrderData];
}

class ServiceInProcessDetailsErrorState extends ServiceState {
  final String message;

  ServiceInProcessDetailsErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}