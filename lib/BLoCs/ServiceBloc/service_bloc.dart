import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:golden_falcon/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:golden_falcon/Models/ServiceModel/ServiceDashboard/serviceDashboardCountModel.dart';
import 'package:golden_falcon/Models/ServiceModel/ServiceDispatchedOrder/serviceDispatchedOrderDetail.dart';
import 'package:golden_falcon/Models/ServiceModel/ServiceDispatchedOrder/serviceDispatchedOrderListModel.dart';
import 'package:golden_falcon/Models/ServiceModel/ServiceInProcessOrder/serviceInProcessOrderDetailsModel.dart';
import 'package:golden_falcon/Models/ServiceModel/ServicePendingOrder/servicePendingOrderListModel.dart';
import 'package:golden_falcon/Repositories/ServiceRepository/service_repository.dart';

import '../../Models/ServiceModel/ServiceInProcessOrder/serviceInProcessOrderListModel.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final ServiceRepository serviceRepository;
  ServiceBloc(this.serviceRepository) : super(ServiceInitial())  {
    on<ServiceDashboardCountEvent>((event, emit) async {
      emit(ServiceDashboardCountFetchingState());
      try {
        Future.delayed(Duration(seconds: 1));
        await serviceRepository.getServiceDashboardCounts(token: event.token, userId: event.userId).then((value) {
          if (value.status == true && value.message == "Dashboard Data!") {
            emit(ServiceDashboardCountFetchedState(value.data));
          } else {
            emit(ServiceDashboardCountErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ServiceDashboardCountErrorState(e.toString()));
      }
    });
    on<ServicePendingOrderEvent>((event, emit) async {
      emit(ServicePendingOrderListFetchingState());
      try {
        await serviceRepository.getServicePendingOrderList(token: event.token, userId: event.userId).then((value) {
          if (value.status == true && value.message == "Pending Orders List!") {
            emit(ServicePendingOrderListFetchedState(value.data));
          } else {
            emit(ServicePendingOrderListErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ServicePendingOrderListErrorState(e.toString()));
      }
    });
    on<ServiceDispatchedOrderEvent>((event, emit) async {
      emit(ServiceDispatchedOrderListFetchingState());
      try {
        await serviceRepository.getDispatchedOrderList(token: event.token, userId: event.userId).then((value) {
          if (value.status == true && value.message == "Dispatched Orders List!") {
            emit(ServiceDispatchedOrderListFetchedState(value.data));
          } else {
            emit(ServiceDispatchedOrderListErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ServiceDispatchedOrderListErrorState(e.toString()));
      }
    });
    on<ServiceDispatchedOrderDetailsEvent>((event, emit) async {
      emit(ServiceDispatchedOrderDetailsFetchingState());
      try {
        await serviceRepository.getDispatchedOrderDetails(token: event.token, userId: event.userId, orderId: event.orderId).then((value) {
          if (value.status == true && value.message == "Orders Details!") {
            emit(ServiceDispatchedOrderDetailsFetchedState(value.data));
          } else {
            emit(ServiceDispatchedOrderDetailsErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ServiceDispatchedOrderDetailsErrorState(e.toString()));
      }
    });
    on<ServiceInProcessOrderListEvent>((event, emit) async {
      emit(ServiceInProcessOrderListFetchingState());
      try {
        await serviceRepository.getInProcessOrderList(token: event.token, userId: event.userId).then((value) {
          if (value.status == true && value.message == "In progress Orders List!") {
            emit(ServiceInProcessOrderListFetchedState(value.data));
          } else {
            emit(ServiceInProcessOrderListErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ServiceInProcessOrderListErrorState(e.toString()));
      }
    });
    on<ServiceInProcessOrderDetailsEvent>((event, emit) async {
      emit(ServiceInProcessDetailsFetchingState());
      try {
        await serviceRepository.getInProcessOrderDetails(token: event.token, body: event.body).then((value) {
          if (value.status == true && value.message == "Orders Details!") {
            emit(ServiceInProcessDetailsFetchedState(value.data));
          } else {
            emit(ServiceInProcessDetailsErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ServiceInProcessDetailsErrorState(e.toString()));
      }
    });
  }
}
