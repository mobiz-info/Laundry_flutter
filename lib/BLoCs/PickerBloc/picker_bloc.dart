import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:golden_falcon/BLoCs/CustomerBloc/customer_bloc.dart';
import 'package:golden_falcon/Models/PickerModel/add_to_cart_model.dart';
import 'package:golden_falcon/Models/PickerModel/deposit_history_model.dart';
import 'package:golden_falcon/Models/PickerModel/expense_drop_down_model.dart';
import 'package:golden_falcon/Models/PickerModel/new_order_save.dart';
import 'package:golden_falcon/Models/PickerModel/order_details_model.dart';
import 'package:golden_falcon/Models/PickerModel/outstanding_model.dart';
import 'package:golden_falcon/Models/PickerModel/picker_category_model.dart';
import 'package:golden_falcon/Models/PickerModel/picker_sub_category_model.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';

import '../../Models/PickerModel/customer_list_model.dart';
import '../../Models/PickerModel/dashboard_count_model.dart';
import '../../Models/PickerModel/expense_list_model.dart';
import '../../Models/PickerModel/location_price_model.dart';
import '../../Models/PickerModel/order_history_model.dart';
import '../../Models/PickerModel/picker_item_price_model.dart';
import '../../Models/PickerModel/picker_order_confirm.dart';
import '../../Models/PickerModel/pickup_list_midel.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';

part 'picker_event.dart';
part 'picker_state.dart';

class PickerBloc extends Bloc<PickerEvent, PickerState> {
  final PickerRepository pickerRepository;
  PickerBloc(this.pickerRepository) : super(PickerInitial()) {
    on<GetDashboardCountEvent>((event, emit) async {
      emit(DashboardCountGettingState());
      try {
        await pickerRepository.getDashboardData(token: event.token, id: event.userid).then((value) {
          if (value.stats == true && value.message == "Picker Dashboard Details!") {
            emit(DashboardCountGotState(
                value.data
            ));
          } else {
            emit(DashboardCountErrorState(value.message));
          }
        });
      } catch (e){
        emit(DashboardCountErrorState(e.toString()));
      }
    });
    on<AddDepositEvent>((event, emit)  async {
      emit(DepositAddingState());
      try {
        await pickerRepository.addDeposit(token: event.token, userId: event.userId, amount: event.amount).then((value) {
          print(value);
          if (value.status == true && value.message == "Data Saved Successfully!") {
            emit(DepositAddedState(value.data.createdDate, value.data.totalAmount, value.data.excess, value.data.short, value.data.staff));
          } else {
            print('else from bloc');
            emit(DepositErrorState(value.message));
          }
        });
      } catch (e) {
        emit(DepositErrorState(e.toString()));
      }
    });
    on<ExpenseHeadGetEvent>((event, emit) async {
      emit(ExpenseHeadGettingState());
      try {
        await pickerRepository.getExpenseHead(token: event.token).then((value) {
          if (value.status == true && value.message == "Dropdown data!") {
            emit(ExpenseHeadSuccessState(value.data));
          } else {
            emit(ExpenseHeadErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ExpenseHeadErrorState(e.toString()));
      }
    });
    on<ExpenseAddEvent>((event, emit) async {
      emit(AddingExpenseState());
      try {
        print("TRY");
        await pickerRepository.addExpense(event.body, event.token).then((value) {
          print("From BLoC");
          print(value.message);
          if (value.status == true && value.message == "Data Saved Successfully!") {
            emit(AddedExpenseState());
          } else {
            emit(ErrorExpenseState(value.message));
          }
        });
      } catch(e) {
        emit(ErrorExpenseState(e.toString()));
      }
    });
    on<ExpenseListFetchEvent>((event, emit) async {
      emit(ExpenseFetchingState());
      try {
        await pickerRepository.getExpenses(id: event.id, token: event.token).then((value) {
          if (value.status == true && value.message == "Expense List!") {
           emit(ExpenseFetchedState(value.data));
          } else {
            emit(ExpenseErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ExpenseErrorState(e.toString()));
      }
    });
    on<OutstandingDueFetchEvent>((event, emit) async {
      emit(OutstandingFetchingState());
      try {
        await pickerRepository.getOutstandings(id: event.id, token: event.token).then((value) {
          if(value.status == true && value.message == "Outstanding Dues List!") {
            emit(OutstandingFetchedState(value.data));
          } else {
            emit(OutStandingErrorState(value.message));
          }
        });
      } catch (e) {
        emit(OutStandingErrorState(e.toString()));
      }
    });
    on<DepositHistoryFetchEvent>((event, emit) async {
      emit(DepositHistoryFetching());
      try {
        await pickerRepository.getHistory(token: event.token, body: event.body).then((value) {
          if (value.status == true && value.message == "Deposit History!") {
            emit(DepostiHistoryFetched(value.data));
          } else {
            emit(DepositHistoryError(value.message));
          }
        });
      } catch(e) {
        emit(DepositHistoryError(e.toString()));
      }
    });
    on<OrderHistoryListEvent>((event, emit) async {
      emit(OrderHistoryFetching());
      try {
        await pickerRepository.getOrderList(token: event.token, data: event.data ).then((value) {
          if (value.status == true && value.message == "Order List!") {
            emit(OrderdHistoryFetched(value.data, value.totalCount));
          } else {
            emit(OrderHistoryError(value.message));
          }
        });
      } catch (e) {
        emit(OrderHistoryError(e.toString()));
      }
    });
    on<OrderDetailsEvent>((event, emit) async {
      emit(OrderHistoryFetching());
      try {
        await pickerRepository.getOrderDetails(orderNo: event.ordNo, token: event.token).then((value) {
          if (value.status == true && value.message == "Customer Order Details!") {
            emit(OrderDetailsFetched(value.data));
          } else {
            emit(OrderDetailsError(value.message));
          }
        });
      } catch(e) {
        emit(OrderDetailsError(e.toString()));
      }
    });
    on<CollectionListFetchEvent>((event, emit) async {
      emit(CollectionListFetchingState());
      try {
        await pickerRepository.getCollectionList(token: event.token, data: event.data).then((value) {
          if (value.status == true && value.message == "Collection List!") {
            emit(CollectionListFetchedState(value.data));
          } else {
            emit(CollectionListErrorState(value.message));
          }
        });
      } catch(e) {
        emit(CollectionListErrorState(e.toString()));
      }
    });
    on<PickupListFetchEvent>((event, emit) async {
      emit(PickupListFetching());
      try {
        await pickerRepository.getPickUps(token: event.token, id: event.id).then((value) {
          if (value.status == true && value.message == "Pickup List!") {
            emit(PickupListFetched(value.data));
          } else {
            emit(PickupListError(value.message));
          }
        });
      } catch (e) {
        emit(PickupListError(e.toString()));
      }
    });
    on<PickerConfirmOrderEvent>((event, emit) async {
      emit(OrderConfirmingState());
      try {
        await pickerRepository.confirmOrder(body: event.body, token: event.token).then((value) {
          if (value.status == true && value.message == "Order Confirmed Successfully!"){
            emit(OrderConfirmedState(value.data));
          } else {
            emit(OrderConfirmerrorState(value.message));
          }
        });
      } catch (e) {
        emit(OrderConfirmerrorState(e.toString()));
      }
    });
    on<PickerPunchInOutEvent>((event, emit) async {
      emit(PickerPunchingInOutState());
      try {
        await pickerRepository.punchIn(token: event.token, id: event.id, task: event.task).then((value) {
          if (value.status == true && value.message == "Successfully Logged In!") {
            emit(PickerPunchedInOutState(value.data[0].punchInTime, value.data[0].punchOutTime == null ? "" : value.data[0].punchOutTime ));
          } else {
            emit(PickerPunchingErrorState(value.message));
          }
        });
      } catch (e) {
        emit(PickerPunchingErrorState(e.toString()));
      }
    });
    on<FetchLocationPriceEvent>((event, emit) async {
      emit(LocationPriceFetching());
      try {
        await pickerRepository.getLPGData(token: event.token).then((value) {
          if (value.status == true && value.message == "Successfully Passed Data!") {
            emit(LocationPriceFetched(value.data.priceGroupList, value.data.customerTypeList));
          } else {
            emit(LocationPriceError(value.message));
          }
        });
      } catch (e) {
        emit(LocationPriceError(e.toString()));
      }
    });
    on<AddNewClientEvent>((event, emit) async {
      emit(AddingNewclient());
      try {
        await pickerRepository.addNewClient(body: event.body, token: event.token).then((value) {
          if (value.status == true && value.message == "New Customer Added Successfully!") {
            emit(AddedNewClient(value.message));
          } else {
            emit(AddNewClientError(value.message));
          }
        });
      } catch (e) {
        emit(AddNewClientError(e.toString()));
      }
    });
    on<ListAllClientsEvent>((event, emit) async {
      emit(FetchingClientList());
      try {
        await pickerRepository.listMyClients(token: event.token, id: event.id).then((value) {
          if (value.status == true && value.message == "Customers List!") {
            emit(FetchedClientList(value.data));
          } else {
            emit(FetchClientListError(value.message));
          }
        });
      } catch (e) {
        emit(FetchClientListError(e.toString()));
      }
    });
    on<AddNewOrderEvent>((event, emit) async {
      emit(AddingNewOrderState());
      try {
        await pickerRepository.saveNewOrder(token: event.token, body: event.body).then((value) {
          if (value.status == true && value.message ==  "Order Successfully Saved!") {
            emit(AddedNewOrderState(value.data));
          } else {
            emit(AddNewOrderErrorState(value.message));
          }
        });
      } catch (e) {
        emit(AddNewOrderErrorState(e.toString()));
      }
    });
    on<PckCategoryFetchEvent>((event, emit) async {
      emit(PckCategoryFetchingState());
      try {
        await pickerRepository.getPickerCategs(id: event.id, token: event.token).then((value) {
          print("*************[VALUE]*******************");
          print(value.data.toList());
          print("*************[VALUE]*******************");
          if (value.status == true && value.message == "Branch Categories List!") {
            emit(PckCategoryFetchedState(value.data));
          } else {
            emit(PckCategoryErrorState(value.message));
          }
        });
      } catch (e) {
        emit(PckCategoryErrorState(e.toString()));
      }
    });
    on<PckSubCategoryFetchEvent>((event, emit) async {
      emit(PckSubCategoryFetchingState());
      try {
        await pickerRepository.getPickerSubCategs(categ_id: event.categId, token: event.token).then((value) {
          if (value.status == true) {
            emit(PckSubCategoryFetchedState(value.data));
          } else {
            emit(PckSubCategoryErrorState(value.message));
          }
        });
      } catch (e) {
        emit(PckSubCategoryErrorState(e.toString()));
      }
    });
    on<PckItemFetchEvent>((event, emit) async {
      emit(PckItemFetchingState());
      try {
        await pickerRepository.getItemsPrice(
            body: {
              "sub_cat_id": event.subCategId,
              "category_id": event.categId,
              "customer_id":event.custId
            },
          token: event.token
        ).then((value) {
          if (value.status == true) {
            emit(PckItemFetchedState(value.data));
          } else {
            emit(PckItemErrorState(value.message));
          }
        });
      } catch (e) {
        emit(PckItemErrorState(e.toString()));
      }
    });
    on<PckAddtoCartEvent>((event, emit) async {
      emit(PckAddingtoCartState());
      try {
        await pickerRepository.addToCart(token: event.token, body: event.body).then((value) {
          if (value.status == true) {
            emit(PckAddedtoCartState(value.data));
          } else {
            emit(PckAddtoCartError(value.message));
          }
        });
      } catch (e) {
        emit(PckAddtoCartError(e.toString()));
      }
    });
  }
}
