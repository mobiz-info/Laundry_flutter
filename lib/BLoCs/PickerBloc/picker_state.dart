part of 'picker_bloc.dart';

abstract class PickerState extends Equatable {
  const PickerState();
}

class PickerInitial extends PickerState {
  @override
  List<Object> get props => [];
}

/***********************[Dashboard Counts]***********************/
class DashboardCountGettingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class DashboardCountGotState extends PickerState {
  DashboardData dashData;
  DashboardCountGotState(this.dashData);
  @override
  List<Object?> get props => [dashData];
}

class DashboardCountErrorState extends PickerState {
  final String message;

  DashboardCountErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Dashboard Counts]***********************/

/***********************[Deposit Add]***********************/
class DepositAddingState extends PickerState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DepositAddedState extends PickerState {
  final DateTime? createdDate;
  final String? totalAmount;
  final String? excess;
  final String? short;
  final String? staff;

  DepositAddedState(this.createdDate, this.totalAmount, this.excess, this.short, this.staff,);

  @override
  // TODO: implement props
  List<Object?> get props => [
    createdDate,
    totalAmount,
    excess,
    short,
    staff
  ];
}

class DepositErrorState extends PickerState {
  final String message;

  DepositErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
/***********************[Deposit Add]***********************/

/***********************[Get Expense Head]***********************/
class ExpenseHeadGettingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class ExpenseHeadSuccessState extends PickerState {
  final String data;
  ExpenseHeadSuccessState(this.data);

  @override
  List<Object?> get props => [data];
}

class ExpenseHeadErrorState extends PickerState {
  final String message;
  ExpenseHeadErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Get Expense Head]***********************/

/***********************[Add Expense]***********************/
class AddingExpenseState extends PickerState {
  @override
  List<Object?> get props => [];
}

class AddedExpenseState extends PickerState {
  @override
  List<Object?> get props => [];
}

class ErrorExpenseState extends PickerState {
  final String message;
  ErrorExpenseState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Add Expense]***********************/

/***********************[Get All Expense]***********************/
class ExpenseFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class ExpenseFetchedState extends PickerState {
  final List<Datum> expenseData;

  ExpenseFetchedState(this.expenseData);
  @override
  List<Object?> get props => [expenseData];

}

class ExpenseErrorState extends PickerState {
  final String message;

  ExpenseErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Get All Expense]***********************/

/***********************[Outstanding Dues]***********************/
class OutstandingFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class OutstandingFetchedState extends PickerState {
  List<OutStand>? data = [];
  OutstandingFetchedState(this.data);

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}

class OutStandingErrorState extends PickerState {
  final String message;

  OutStandingErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Outstanding Dues]***********************/

/***********************[Outstanding Dues]***********************/
class DepositHistoryFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class DepostiHistoryFetched extends PickerState {
  List<DepoHist> data = [];
  DepostiHistoryFetched(this.data);
  @override
  List<Object?> get props => [data];
}

class DepositHistoryError extends PickerState {
  final String message;

  DepositHistoryError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Outstanding Dues]***********************/

/***********************[Order History List]***********************/
class OrderHistoryFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class OrderdHistoryFetched extends PickerState {
     List<OrderHist> data=[];
     TotalCount tc;
    OrderdHistoryFetched(this.data, this.tc);
  @override
  List<Object?> get props => [data, tc];
}

class OrderHistoryError extends PickerState {
  final String message;

  OrderHistoryError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Order History List]***********************/

/***********************[Order Details]***********************/
class OrderDetailsFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class OrderDetailsFetched extends PickerState {
  final Data finalData;

  OrderDetailsFetched(this.finalData);

  @override
  List<Object?> get props => [finalData];
}

class OrderDetailsError extends PickerState {
  final String message;

  OrderDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Order Details]***********************/

/***********************Collection List]***********************/
class CollectionListFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class CollectionListFetchedState extends PickerState {
  List data = [];
  CollectionListFetchedState(this.data);

  @override
  List<Object?> get props => [data];
}

class CollectionListErrorState extends PickerState {
  final String message;

  CollectionListErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************Collection List]***********************/

/***********************[Pickup List]***********************/
class PickupListFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class PickupListFetched extends PickerState {
  List<PckPickupList> fData;

  PickupListFetched(this.fData);

  @override
  List<Object?> get props => [fData];
}

class PickupListError extends PickerState {
  final String message;

  PickupListError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Pickup List]***********************/


/***********************[Order Confirm]***********************/
class OrderConfirmingState extends PickerState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OrderConfirmedState extends PickerState {
  final List<PckOrderCnfrmList> cnfrmList;

  OrderConfirmedState(this.cnfrmList);

  @override
  // TODO: implement props
  List<Object?> get props => [cnfrmList];
}

class OrderConfirmerrorState extends PickerState {
  final String message;

  OrderConfirmerrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
/***********************[Order Confirm]***********************/


/***********************[Picker Punch In]***********************/
class PickerPunchingInOutState extends PickerState {
  @override
  List<Object?> get props => [];
}

class PickerPunchedInOutState extends PickerState {
  final String punchIn_time;
  final String punchOut_time;

  PickerPunchedInOutState(this.punchIn_time, this.punchOut_time);

  @override
  List<Object?> get props => [punchIn_time, punchOut_time];
}

class PickerPunchingErrorState extends PickerState {
  final String message;

  PickerPunchingErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Picker Punch In]***********************/

/***********************[Location Price Group]***********************/
class LocationPriceFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class LocationPriceFetched extends PickerState {
  List<PriceGroupList> pgList = [];
  CustomerTypeList ctList;

  LocationPriceFetched(this.pgList, this.ctList);

  @override
  List<Object?> get props => [pgList, ctList];
}

class LocationPriceError extends PickerState {
  final String message;

  LocationPriceError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Location Price Group]***********************/

/***********************[Add New Client]***********************/
class AddingNewclient extends PickerState {
  @override
  List<Object?> get props => [];
}

class AddedNewClient extends PickerState {
  final String message;

  AddedNewClient(this.message);

  @override
  List<Object?> get props => [message];
}

class AddNewClientError extends PickerState {
  final String message;

  AddNewClientError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Add New Client]***********************/

/***********************[List my Client]***********************/
class FetchingClientList extends PickerState {
  @override
  List<Object?> get props => [];
}

class FetchedClientList extends PickerState {
  List<CustomerListData> customerList = [];

  FetchedClientList(this.customerList);

  @override
  // TODO: implement props
  List<Object?> get props => [customerList];
}

class FetchClientListError extends PickerState {
  final String message;

  FetchClientListError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[List my Client]***********************/

/***********************[Add New Order]***********************/
class AddingNewOrderState extends PickerState {
  @override
  List<Object?> get props => [];
}

class AddedNewOrderState extends PickerState {
 final NewOrderData ordData;
  AddedNewOrderState(this.ordData);

  @override
  List<Object?> get props => [ordData];
}

class AddNewOrderErrorState extends PickerState {
  final String message;

  AddNewOrderErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Add New Order]***********************/

/***********************[Get Category]***********************/
class PckCategoryFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class PckCategoryFetchedState extends PickerState {
  List<PickerCategList> categList = [];

  PckCategoryFetchedState(this.categList);

  @override
  List<Object?> get props => [categList];
}

class PckCategoryErrorState extends PickerState {
  final String message;

  PckCategoryErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Get Category]***********************/

/***********************[Get Sub Category]***********************/
class PckSubCategoryFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class PckSubCategoryFetchedState extends PickerState {
  List<PickerSubCategList> subCategList = [];

  PckSubCategoryFetchedState(this.subCategList);

  @override
  List<Object?> get props => [subCategList];
}

class PckSubCategoryErrorState extends PickerState {
  final String message;

  PckSubCategoryErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Get Sub Category]***********************/

/***********************[Get Item List]***********************/
class PckItemFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class PckItemFetchedState extends PickerState {
  List<List<PckItemPriceList>> pckItemList = [];

  PckItemFetchedState(this.pckItemList);

  @override
  List<Object?> get props => [pckItemList];
}

class PckItemErrorState extends PickerState {
  final String message;

  PckItemErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Get Item List]***********************/

/***********************[Add to Cart]***********************/
class PckAddingtoCartState extends PickerState {
  @override
  List<Object?> get props => [];
}

class PckAddedtoCartState extends PickerState {
  List<AddCartList> adCrtList = [];

  PckAddedtoCartState(this.adCrtList);

  @override
  List<Object?> get props => [adCrtList];
}

class PckAddtoCartError extends PickerState {
  final String message;

  PckAddtoCartError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Add to Cart]***********************/