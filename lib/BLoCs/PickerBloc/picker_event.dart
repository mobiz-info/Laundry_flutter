part of 'picker_bloc.dart';

abstract class PickerEvent extends Equatable {
  const PickerEvent();
}

// Dashboard Counts
class GetDashboardCountEvent extends PickerEvent {
  final String token;
  final String userid;

  GetDashboardCountEvent(this.token, this.userid);

  @override
  List<Object?> get props => [token, userid];
}

// Deposit Add
class AddDepositEvent extends PickerEvent {
  final String token;
  final String userId;
  final String amount;

  AddDepositEvent(this.token, this.userId, this.amount);

  @override
  List<Object?> get props => [token, userId, amount];
}

// Get Expense Head
class ExpenseHeadGetEvent extends PickerEvent {
  final String token;
  ExpenseHeadGetEvent(this.token);
  @override
  List<Object?> get props => [token];
}

// Add Expene
class ExpenseAddEvent extends PickerEvent {
  Map<String, String> body;
  final String token;
  ExpenseAddEvent(this.body, this.token);

  @override
  List<Object?> get props => [body, token];
}

// List all Expenses
class ExpenseListFetchEvent extends PickerEvent {
  final String token;
  final String id;

  ExpenseListFetchEvent(this.token, this.id);

  @override
  List<Object?> get props =>[token, id];
}

// List OutStanding
class OutstandingDueFetchEvent extends PickerEvent {
  final String id;
  final String token;

  OutstandingDueFetchEvent(this.id, this.token);
  @override
  List<Object?> get props => [id, token];
}

// List Deposit History
class DepositHistoryFetchEvent extends PickerEvent {
  final String token;
  final Map<String, String> body;

  DepositHistoryFetchEvent(this.token, this.body);

  @override
  List<Object?> get props => [token, body];
}

// Order history List
class OrderHistoryListEvent extends PickerEvent {
  final String token;
  final Map<String, String> data;

  OrderHistoryListEvent(this.token, this.data);

  @override
  List<Object?> get props => [token, data];
}

// order details
class OrderDetailsEvent extends PickerEvent {
  final String token;
  final String ordNo;

  OrderDetailsEvent(this.token, this.ordNo);

  @override
  List<Object?> get props => [token, ordNo];
}

// Collection List Event
class CollectionListFetchEvent extends PickerEvent {
  final String token;
  final Map<String, String> data;

  CollectionListFetchEvent(this.token, this.data);

  @override
  List<Object?> get props => [token, data];
}

// Pickup List
class PickupListFetchEvent extends PickerEvent {
  final String token;
  final String id;

  PickupListFetchEvent(this.token, this.id);

  @override
  List<Object?> get props => [token, id];
}

// Confirm New Order
class PickerConfirmOrderEvent extends PickerEvent {
  final Map<String, String> body;
  final String token;

  PickerConfirmOrderEvent(this.body, this.token);

  @override
  // TODO: implement props
  List<Object?> get props => [body, token];
}

// Punch In
class PickerPunchInOutEvent extends PickerEvent {
  final String token;
  final String task;
  final String id;

  PickerPunchInOutEvent(this.token, this.id, this.task);

  @override
  List<Object?> get props => [token, id];
}

// Location Price Group
class FetchLocationPriceEvent extends PickerEvent {
  final String token;

  FetchLocationPriceEvent(this.token);
  @override
  List<Object?> get props => [token];
}

// Add Client
class AddNewClientEvent extends PickerEvent {
  final Map<String, String> body;
  final String token;

  AddNewClientEvent(this.body, this.token);

  @override
  List<Object?> get props => [body, token];
}

// List Client
class ListAllClientsEvent extends PickerEvent {
  final String id;
  final String token;

  ListAllClientsEvent(this.id, this.token);
  @override
  List<Object?> get props => [id, token];

}

// Add New Order
class AddNewOrderEvent extends PickerEvent {
  final Map<String, String> body;
  final String token;

  AddNewOrderEvent(this.body, this.token);

  @override
  List<Object?> get props => [body, token];
}

// Get Category
class PckCategoryFetchEvent extends PickerEvent {
  final String token;
  final String id;

  PckCategoryFetchEvent(this.token, this.id);

  @override
  List<Object?> get props => [token, id];
}

// Get Sub Category
class PckSubCategoryFetchEvent extends PickerEvent {
  final String token;
  final String categId;

  PckSubCategoryFetchEvent(this.token, this.categId);

  @override
  List<Object?> get props => [token, categId];
}

class PckItemFetchEvent extends PickerEvent {
  final String token;
  final String categId;
  final String subCategId;
  final String custId;

  PckItemFetchEvent(this.token, this.categId, this.subCategId, this.custId);

  @override
  List<Object?> get props => [token, categId, subCategId, custId];
}

class PckAddtoCartEvent extends PickerEvent {
  final Map<String, String> body;
  final String token;

  PckAddtoCartEvent(this.body, this.token);



  @override
  List<Object?> get props => [token,body];
}