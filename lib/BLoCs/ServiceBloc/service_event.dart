part of 'service_bloc.dart';

abstract class ServiceEvent extends Equatable {
  const ServiceEvent();
}

// Dashboard Count
class ServiceDashboardCountEvent extends ServiceEvent {
  final String token;
  final String userId;

  ServiceDashboardCountEvent(this.token, this.userId);
  @override
  // TODO: implement props
  List<Object?> get props => [token, userId];

}

// Pending order list
class ServicePendingOrderEvent extends ServiceEvent {
  final String token;
  final String userId;

  ServicePendingOrderEvent(this.token, this.userId);
  @override
  List<Object?> get props => [token, userId];

}

// Dispatched Order List
class ServiceDispatchedOrderEvent extends ServiceEvent {
  final String token;
  final String userId;

  ServiceDispatchedOrderEvent(this.token, this.userId);
  @override
  List<Object?> get props => [token, userId];

}

// Dispatched Order Details
class ServiceDispatchedOrderDetailsEvent extends ServiceEvent {
  final String token;
  final String userId;
  final String orderId;

  ServiceDispatchedOrderDetailsEvent(this.token, this.userId, this.orderId);
  @override
  List<Object?> get props => [token, userId,orderId];

}

// InProcessOrderList
class ServiceInProcessOrderListEvent extends ServiceEvent {
  final String token;
  final String userId;

  ServiceInProcessOrderListEvent(this.token, this.userId);
  @override
  List<Object?> get props => [token, userId];

}

// InProcessOrderData
class ServiceInProcessOrderDetailsEvent extends ServiceEvent {
  final String token;
  final Map<String, String> body;

  ServiceInProcessOrderDetailsEvent(this.token, this.body);
  @override
  List<Object?> get props => [token, body];

}

// Complaint List Fetching
// class ComplaintListFetchEvent extends ServiceEvent{
//   final String token;
//   final String id;
//
//   ComplaintListFetchEvent(this.token, this.id);
//
//   @override
//   List<Object?> get props => [token, id];
// }
