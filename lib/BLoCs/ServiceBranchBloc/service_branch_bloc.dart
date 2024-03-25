import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Repositories/ServiceBranchRepo/service_branch_repo.dart';
import 'package:equatable/equatable.dart';

import '../../Models/ServiceBranchModel/accept_orders_model.dart';
import '../../Models/ServiceBranchModel/accept_search_model.dart';
import '../../Models/ServiceBranchModel/add_order_model.dart';
import '../../Models/ServiceBranchModel/completed_order_search_model.dart';
import '../../Models/ServiceBranchModel/completed_orders_model.dart';
import '../../Models/ServiceBranchModel/engage_orders_model.dart';
import '../../Models/ServiceBranchModel/engage_search_model.dart';
import '../../Models/ServiceBranchModel/gen_invoice_search_model.dart';
import '../../Models/ServiceBranchModel/generate_invoice_model.dart';
import '../../Models/ServiceBranchModel/new_order_model.dart';
import '../../Models/ServiceBranchModel/new_order_dash_search_model.dart';
import '../../Models/ServiceBranchModel/order_search_model.dart';
import '../../Models/ServiceBranchModel/pending_orders_model.dart';
import '../../Models/ServiceBranchModel/pending_search_model.dart';
import '../../Models/ServiceBranchModel/ready_delivery_model.dart';
import '../../Models/ServiceBranchModel/ready_delivery_search_model.dart';
import '../../Models/ServiceBranchModel/ser_cart_count_model.dart';
import '../../Models/ServiceBranchModel/ser_cart_inc_dec_model.dart';
import '../../Models/ServiceBranchModel/ser_cart_list_model.dart' as CartList;
import '../../Models/ServiceBranchModel/ser_cart_list_model.dart';
import '../../Models/ServiceBranchModel/ser_delivery_address_model.dart';
import '../../Models/ServiceBranchModel/ser_items_add_cart_model.dart';
import '../../Models/ServiceBranchModel/ser_items_inc_dec_model.dart';
import '../../Models/ServiceBranchModel/ser_payment_mtd_model.dart';
import '../../Models/ServiceBranchModel/ser_place_order_model.dart';
import '../../Models/ServiceBranchModel/ser_thank_you_model.dart';
import '../../Models/ServiceBranchModel/service_category_model.dart';
import '../../Models/ServiceBranchModel/service_dashboard_model.dart';
import '../../Models/ServiceBranchModel/service_delivery_date_model.dart';
import '../../Models/ServiceBranchModel/service_delivery_mode_model.dart';
import '../../Models/ServiceBranchModel/service_items_list_model.dart';
import '../../Models/ServiceBranchModel/service_order_status_model.dart';
import '../../Models/ServiceBranchModel/service_subcategory_model.dart';
part 'service_branch_event.dart';
part 'service_branch_state.dart';

class ServiceBranchBloc extends Bloc<ServiceBranchEvent, ServiceBranchState> {
  final ServiceBranchRepository serviceBranchRepository;

  ServiceBranchBloc(this.serviceBranchRepository) : super(ServiceBranchInitial()) {

    on<GetServiceDashEvent>((event, emit) async {
      emit(ServiceDashFetching());
      try {
        await serviceBranchRepository.getServiceDash(
            token: event.token).then((value) {
          if (value.status == true &&
              value.message == "Dashboard count listed Successfully!") {
            emit(ServiceDashFetched(value.data));
          } else {
            emit(ServiceDashError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(ServiceDashError(e.toString()));
      }
    });

    on<GetSerOrderStatusEvent>((event, emit) async {
      emit(SerOrderStatusFetching());
      try {
        await serviceBranchRepository.getSerOrderStatusData(
            token: event.token, mobileNum: event.mobileNum, orderNum: event.orderNum).then((value) {
          if (value.status == true &&
              value.message == "Order details") {
            emit(SerOrderStatusFetched(value.data));
          } else {
            emit(SerOrderStatusError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(SerOrderStatusError(e.toString()));
      }
    });

    on<GetEngageOrdersEvent>((event, emit) async {
      emit(EngageOrdersFetching());
      try {
        await serviceBranchRepository.getEngageData(token: event.token).then((value) {
          if (value.status == true &&
              value.message == "Orders successfully listed") {
            emit(EngageOrdersFetched(value.data));
          } else {
            emit(EngageOrdersError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(EngageOrdersError(e.toString()));
      }
    });

    on<GetGenInvoiceEvent>((event, emit) async {
      emit(GenInvoiceFetching());
      try {
        await serviceBranchRepository.getInvoiceData(token: event.token).then((value) {
          if (value.status == true &&
              value.message == "Invoice Data Saved Successfully!") {
            emit(GenInvoiceFetched(value.data));
          } else {
            emit(GenInvoiceError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(GenInvoiceError(e.toString()));
      }
    });

    on<GetSearchInvoiceEvent>((event, emit) async {
      emit(SearchInvoiceFetching());
      try {
        await serviceBranchRepository.getSearchInvoiceData(token: event.token, orderNum: event.orderNum).then((value) {
          if (value.status == true &&
              value.message == "Invoice Data Saved Successfully!") {
            emit(SearchInvoiceFetched(value.data));
          } else {
            emit(SearchInvoiceError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(SearchInvoiceError(e.toString()));
      }
    });

    on<GetSearchEngageEvent>((event, emit) async {
      emit(SearchEngageFetching());
      try {
        await serviceBranchRepository.getSearchEngageData(token: event.token, orderNum: event.orderNum).then((value) {
          if (value.status == true &&
              value.message == "Order Successfully listed!") {
            emit(SearchEngageFetched(value.data));
          } else {
            emit(SearchEngageError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(SearchEngageError(e.toString()));
      }
    });

    on<GetEngageStatusEvent>((event, emit) async {
      emit(EngageStatusFetching());
      try {
        await serviceBranchRepository.getEngageStatus(token: event.token, orderNum: event.orderNum!).then((value) {
          if (value.status == true &&
              value.message == "Order engaged successfully") {
            emit(EngageStatusFetched(value.data));
          } else {
            emit(EngageStatusError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(EngageStatusError(e.toString()));
      }
    });

    on<GetPendingOrdersEvent>((event, emit) async {
      emit(PendingOrdersFetching());
      try {
        await serviceBranchRepository.getPendingOrdersData(token: event.token).then((value) {
          if (value.status == true &&
              value.message == "Orders successfully listed") {
            emit(PendingOrdersFetched(value.data));
          } else {
            emit(PendingOrdersError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(PendingOrdersError(e.toString()));
      }
    });

    on<GetCompletedOrdersEvent>((event, emit) async {
      emit(CompletedOrdersFetching());
      try {
        await serviceBranchRepository.getCompletedOrdersData(token: event.token).then((value) {
          if (value.status == true &&
              value.message == "Orders successfully listed") {
            emit(CompletedOrdersFetched(value.data));
          } else {
            emit(CompletedOrdersError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(CompletedOrdersError(e.toString()));
      }
    });

    on<GetPendingStatusEvent>((event, emit) async {
      emit(PendingStatusFetching());
      try {
        await serviceBranchRepository.getPendingStatus(token: event.token, orderNum: event.orderNum!).then((value) {
          if (value.status == true &&
              value.message == "Order status changed successfully") {
            emit(PendingStatusFetched(value.data));
          } else {
            emit(PendingStatusError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(PendingStatusError(e.toString()));
      }
    });

    on<GetCompletedStatusEvent>((event, emit) async {
      emit(CompletedStatusFetching());
      try {
        await serviceBranchRepository.getCompletedStatus(token: event.token, orderNum: event.orderNum!).then((value) {
          if (value.status == true &&
              value.message == "Order status changed successfully") {
            emit(CompletedStatusFetched(value.data));
          } else {
            emit(CompletedStatusError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(CompletedStatusError(e.toString()));
      }
    });

    on<GetReadyDeliveryEvent>((event, emit) async {
      emit(ReadyDeliveryFetching());
      try {
        await serviceBranchRepository.getReadyDeliveryData(token: event.token).then((value) {
          if (value.status == true &&
              value.message == "Orders successfully listed") {
            emit(ReadyDeliveryFetched(value.data));
          } else {
            emit(ReadyDeliveryError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(ReadyDeliveryError(e.toString()));
      }
    });

    on<GetSearchReadyDeliveryEvent>((event, emit) async {
      emit(ReadyDeliverySearchFetching());
      try {
        await serviceBranchRepository.getSearchReadyDeliData(token: event.token, orderNum: event.orderNum).then((value) {
          if (value.status == true &&
              value.message == "Orders successfully listed") {
            emit(ReadyDeliverySearchFetched(value.data));
          } else {
            emit(ReadyDeliverySearchError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(ReadyDeliverySearchError(e.toString()));
      }
    });

    on<GetNewOrderSearchEvent>((event, emit) async {
      emit(NewOrderSearchFetching());
      print('ffff ${event.mobileNum}');
      try {
        await serviceBranchRepository.getOrderSearchData(token: event.token, mobileNum: event.mobileNum).then((value) {
          if (value.status == true &&
              value.message == "Customer Details !") {
            emit(NewOrderSearchFetched(value.data));
          } else {
            emit(NewOrderSearchError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(NewOrderSearchError(e.toString()));
      }
    });

    on<GetSerDeliveryModeEvent>((event, emit) async {
      emit(SerDeliveryModeFetching());
      try {
        await serviceBranchRepository.getSerDeliveryModeData(token: event.token).then((value) {
          if (value.status == true &&
              value.message == "data passed successfully") {
            emit(SerDeliveryModeFetched(value.data));
          } else {
            emit(SerDeliveryModeError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(SerDeliveryModeError(e.toString()));
      }
    });

    on<GetSerDeliveryDateEvent>((event, emit) async {
      emit(SerDeliveryDateFetching());
      try {
        await serviceBranchRepository.getDeliveryDateData(token: event.token, deliveryMode: event.deliveryMode).then((value) {
          if (value.status == true &&
              value.message == "Delivery Dates passed successfully") {
            emit(SerDeliveryDateFetched(value.data));
          } else {
            emit(SerDeliveryDateError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(SerDeliveryDateError(e.toString()));
      }
    });

    on<GetSerDeliveryTimeEvent>((event, emit) async {
      emit(SerDeliveryTimeFetching());
      try {
        await serviceBranchRepository.getDeliveryTimeData(token: event.token, date: event.date).then((value) {
          if (value.status == true &&
              value.message == "Time Intervals") {
            emit(SerDeliveryTimeFetched(value.data));
          } else {
            emit(SerDeliveryTimeError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(SerDeliveryTimeError(e.toString()));
      }
    });

    on<GetAddOrderEvent>((event, emit) async {
      emit(AddOrderFetching());
      try {
        await serviceBranchRepository.getAddOrderData(token: event.token, customerId: event.customerId,
        orderType: event.orderType, deliveryDate: event.deliveryDate, deliveryTime: event.deliveryTime).then((value) {
          if (value.status == true &&
              value.message == "Order Successfully Saved!") {
            emit(AddOrderFetched(value.data));
          } else {
            emit(AddOrderError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(AddOrderError(e.toString()));
      }
    });

    on<GetSearchPendingOrdersEvent>((event, emit) async {
      emit(SearchPendingOrdersFetching());
      try {
        await serviceBranchRepository.getSearchPendingData(token: event.token, orderNum: event.orderNum).then((value) {
          if (value.status == true &&
              value.message == "Order Successfully listed!") {
            emit(SearchPendingOrdersFetched(value.data));
          } else {
            emit(SearchPendingOrdersError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(SearchPendingOrdersError(e.toString()));
      }
    });

    on<GetSearchCompletedOrdersEvent>((event, emit) async {
      emit(SearchCompletedOrdersFetching());
      try {
        await serviceBranchRepository.getSearchCompletedData(token: event.token, orderNum: event.orderNum).then((value) {
          if (value.status == true &&
              value.message == "Order Successfully listed!") {
            emit(SearchCompletedOrdersFetched(value.data));
          } else {
            emit(SearchCompletedOrdersError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(SearchCompletedOrdersError(e.toString()));
      }
    });

    on<GetServiceCategoryEvent>((event, emit) async {
      emit(ServiceCategoryFetching());
      try {
        await serviceBranchRepository.getCategoryData(token: event.token).then((value) {
          if (value.status == true &&
              value.message == "Branch Categories List!") {
            emit(ServiceCategoryFetched(value.data));
          } else {
            emit(ServiceCategoryError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(ServiceCategoryError(e.toString()));
      }
    });

    on<GetServiceSubCategoryEvent>((event, emit) async {
      emit(ServiceSubCategoryFetching());
      try {
        await serviceBranchRepository.getSubCategoryData(token: event.token, categoryId: event.categoryId).then((value) {
          if (value.status == true &&
              value.message == "Branch Sub Categories List!") {
            emit(ServiceSubCategoryFetched(value.data));
          } else {
            emit(ServiceSubCategoryError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(ServiceSubCategoryError(e.toString()));
      }
    });

    on<GetAcceptOrdersEvent>((event, emit) async {
      emit(AcceptOrdersFetching());
      try {
        await serviceBranchRepository.getAcceptOrdersData(token: event.token).then((value) {
          if (value.status == true &&
              value.message == "Orders successfully listed") {
            emit(AcceptOrdersFetched(value.data));
          } else {
            emit(AcceptOrdersError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(AcceptOrdersError(e.toString()));
      }
    });

    on<GetAcceptStatusEvent>((event, emit) async {
      emit(AcceptStatusFetching());
      try {
        await serviceBranchRepository.getAcceptStatus(token: event.token).then((value) {
          if (value.status == true &&
              value.message == "Order status changed successfully") {
            emit(AcceptStatusFetched(value.data));
          } else {
            emit(AcceptStatusError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(AcceptStatusError(e.toString()));
      }
    });

    on<GetServiceItemsListEvent>((event, emit) async {
      emit(ServiceItemsListFetching());
      try {
        await serviceBranchRepository.getItemsData(
            token: event.token, categoryId: event.catId, subCategoryId: event.subCatId,
        customerId: event.customerId, orderId: event.orderId).then((value) {
          if (value.status == true &&
              value.message == "Item price List!") {
            emit(ServiceItemsListFetched(value.data));
          } else {
            emit(ServiceItemsListError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(ServiceItemsListError(e.toString()));
      }
    });

    on<GetItemsIncDecEvent>((event, emit) async {
      emit(ItemsIncDecFetching());
      try {
        await serviceBranchRepository.getItemsIncDec(token: event.token, orderId: event.orderId,
            priceListId: event.priceListId, itemServiceId: event.itemServiceId, quantity: event.quantity).then((value) {
          if (value.status == true &&
              value.message == "Total amount changed Successfully!") {
            emit(ItemsIncDecFetched(value.data));
          } else {
            emit(ItemsIncDecError(value.message));
          }
        });
      } catch (e) {
        emit(ItemsIncDecError(e.toString()));
      }
    });

    on<GetItemsAddCartEvent>((event, emit) async {
      emit(ItemsAddCartFetching());
      try {
        await serviceBranchRepository.getItemsAddCart(
            token: event.token,
            orderId: event.orderId,
            priceListId: event.priceListId,
            itemServiceId: event.itemServiceId,
            quantity: event.quantity,
            amount: event.amount).then((value) {
          if (value.status == true &&
              value.message == "Already Added this item to the cart!") {
            emit(ItemsAddCartFetched(value.data));
          } else {
            emit(ItemsAddCartError(value.message));
          }
        });
      } catch (e) {
        emit(ItemsAddCartError(e.toString()));
      }
    });

    on<GetSerCartListEvent>((event, emit) async {
      emit(ServiceCartListFetching());
      try {
        await serviceBranchRepository.getCartListData(token: event.token, orderId: event.orderId).then((value) {
          if (value.status == true &&
              value.message == "Customer Cart List!") {
            emit(ServiceCartListFetched(value.data, value.data?.cart?.first.order?.customer?.toJson()));
          } else {
            emit(ServiceCartListError(value.message));
          }
        });
      } catch (e) {
        emit(ServiceCartListError(e.toString()));
      }
    });

    on<GetSerCartCountEvent>((event, emit) async {
      emit(SerCartCountFetching());
      try {
        await serviceBranchRepository.getSerCartCount(token: event.token, orderId: event.orderId,).then((value) {
          if (value.status == true && value.message == "Cart Count!") {
            emit(SerCartCountFetched(value.data));
          } else {
            emit(SerCartCountError(value.message));
          }
        });
      } catch (e) {
        emit(SerCartCountError(e.toString()));
      }
    });

    on<GetCartIncDecEvent>((event, emit) async {
      emit(CartIncDecFetching());
      try {
        await serviceBranchRepository.getCartIncDec(token: event.token, cartId: event.cartId, orderId: event.orderId,
            priceListId: event.priceListId, itemServiceId: event.itemServiceId, quantity: event.quantity).then((value) {
          if (value.status == true && value.message == "Amount successfully updated") {
            emit(CartIncDecFetched(value.data));
          } else {
            emit(CartIncDecError(value.message));
          }
        });
      } catch (e) {
        emit(CartIncDecError(e.toString()));
      }
    });

    on<GetDeliveryAddressEvent>((event, emit) async {
      print('checkkkkk');
      CartList.Customer customerData = CartList.Customer(
          name: event.address["name"],
          buildingName: event.address["building_name_no"],
          buildingNo: '',
          floorNumber: event.address["floor_no"],
          flatNumber: event.address["flat_no_house_no"],
          mobile: event.address["person_incharge_mob"]
      );
      emit(ServiceCartListFetched(event.data, customerData.toJson()));
    });

    on<GetPaymentListEvent>((event, emit) async {
      emit(SerPaymentListFetching());
      try {
        await serviceBranchRepository.getPaymentListData(token: event.token).then((value) {
          if (value.status == true && value.message == "data passed successfully") {
            emit(SerPaymentListFetched(value.data));
          } else {
            emit(SerPaymentListError(value.message));
          }
        });
      } catch (e) {
        emit(SerPaymentListError(e.toString()));
      }
    });

    on<GetCartDeleteEvent>((event, emit) async {
      emit(SerCartDeleteFetching());
      try {
        await serviceBranchRepository.getDeleteData(token: event.token, cartId: event.cartId).then((value) {
          if (value.status == true && value.message == "Cart Deleted Successfully!") {
            emit(SerCartDeleteFetched(value.message));
          } else {
            emit(SerCartDeleteError(value.message));
          }
        });
      } catch (e) {
        emit(SerCartDeleteError(e.toString()));
      }
    });

    on<GetSearchAcceptEvent>((event, emit) async {
      emit(SearchAcceptOrdersFetching());
      try {
        await serviceBranchRepository.getSearchAcceptData(token: event.token, orderNum: event.orderNum).then((value) {
          if (value.status == true && value.message == "Order Successfully listed!") {
            emit(SearchAcceptOrdersFetched(value.data));
          } else {
            emit(SearchAcceptOrdersError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(SearchAcceptOrdersError(e.toString()));
      }
    });

    on<GetNewOrdersEvent>((event, emit) async {
      emit(NewOrderFetching());
      try {
        await serviceBranchRepository.getNewOrderData(token: event.token).then((value) {
          if (value.status == true && value.message == "Orders successfully listed") {
            emit(NewOrderFetched(value.data));
          } else {
            emit(NewOrderError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(NewOrderError(e.toString()));
      }
    });

    on<GetNewOrderStatusEvent>((event, emit) async {
      emit(NewOrderStatusFetching());
      try {
        await serviceBranchRepository.getNewOrderStatus(token: event.token, orderNum: event.orderNum!).then((value) {
          if (value.status == true && value.message == "Order engaged successfully") {
            emit(NewOrderStatusFetched(value.data));
          } else {
            emit(NewOrderStatusError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(NewOrderStatusError(e.toString()));
      }
    });

    on<GetSearchNewOrderEvent>((event, emit) async {
      emit(SearchNewOrdersFetching());
      try {
        await serviceBranchRepository.getSearchNewOrderData(token: event.token, orderNum: event.orderNum).then((value) {
          if (value.status == true && value.message == "Order Successfully listed!") {
            emit(SearchNewOrdersFetched(value.data));
          } else {
            emit(SearchNewOrdersError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(SearchNewOrdersError(e.toString()));
      }
    });

    on<GetSerCartWalletBalEvent>((event, emit) async {
      emit(SerCartWalletBalFetching());
      try {
        await serviceBranchRepository.getCartWalletBalData(token: event.token,
            orderId: event.orderId,
            customerId: event.customerId).then((value) {
          if (value.message == "No outstanding dues") {
            emit(SerCartWalletBalFetched(value.message));
          } else {
            emit(SerCartWalletBalError(value.message));
          }
        });
      } catch (e) {
        emit(SerCartWalletBalError(e.toString()));
      }
    });

    on<GetSerPlaceOrderEvent>((event, emit) async {
      emit(SerPlaceOrderFetching());
      try {
        await serviceBranchRepository.getSerPlaceOrderData(
            token: event.token,
            customerId: event.customerId,
            orderId: event.orderId,
            discount: event.discount,
            netTaxable: event.netTaxable,
            vat: event.vat,
            grandTotal: event.grandTotal,
            collectMode: event.collectMode,
            payedAmount: event.payedAmount,
            customerAddress: event.customerAddress
        ).then((value) {
          if (value.message == "Payment Added Successfully!") {
            emit(SerPlaceOrderFetched(value.data));
          } else {
            emit(SerPlaceOrderError(value.message));
          }
        });
      } catch (e) {
        emit(SerPlaceOrderError(e.toString()));
      }
    });

    on<GetSerThankYouEvent>((event, emit) async {
      emit(SerThankYouFetching());
      try {
        await serviceBranchRepository.getThankYouData(token: event.token,
            orderId: event.orderId,
            customerId: event.customerId).then((value) {
          if (value.message == "Data passed successfully!") {
            emit(SerThankYouFetched(value.data));
          } else {
            emit(SerThankYouError(value.message));
          }
        });
      } catch (e) {
        emit(SerThankYouError(e.toString()));
      }
    });

  }
}