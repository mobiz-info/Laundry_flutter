import 'dart:convert';
/// status : true
/// data : [{"order_number":"21a3b224","status":"Confirmation Pending"},{"order_number":"32a76224","status":"Confirmation Pending"},{"order_number":"17c21224","status":"Confirmation Pending"},{"order_number":"62af9224","status":"Confirmation Pending"},{"order_number":"2a56a224","status":"Items Collected"},{"order_number":"d4390224","status":"Confirmation Pending"},{"order_number":"8c56b224","status":"Confirmed"},{"order_number":"7d3c3224","status":"Confirmed"},{"order_number":"cc792224","status":"Confirmed"},{"order_number":"eb274224","status":"Confirmed"},{"order_number":"a7cf3224","status":"Confirmed"},{"order_number":"215c1224","status":"Confirmed"},{"order_number":"e77c8224","status":"Confirmed"},{"order_number":"7025b224","status":"Confirmed"},{"order_number":"261d7124","status":"Confirmed"},{"order_number":"29d96124","status":"Confirmed"},{"order_number":"faee6124","status":"Confirmation Pending"},{"order_number":"b061d124","status":"Confirmation Pending"},{"order_number":"26da3124","status":"Confirmation Pending"},{"order_number":"77f41124","status":"Confirmation Pending"},{"order_number":"caf54124","status":"Confirmation Pending"},{"order_number":"58796124","status":"Confirmation Pending"},{"order_number":"31f6e124","status":"Confirmation Pending"},{"order_number":"799a7124","status":"Confirmation Pending"},{"order_number":"628b9124","status":"Confirmation Pending"},{"order_number":"4cd49124","status":"Confirmation Pending"},{"order_number":"80a85124","status":"Confirmation Pending"},{"order_number":"a8efc124","status":"Confirmation Pending"},{"order_number":"56eb9124","status":"Confirmation Pending"},{"order_number":"9937c124","status":"Confirmation Pending"},{"order_number":"451ea124","status":"Confirmation Pending"},{"order_number":"fbe50124","status":"Confirmation Pending"},{"order_number":"45365124","status":"Items Collected"},{"order_number":"53765124","status":"Confirmed"},{"order_number":"fbe8f124","status":"Confirmed"},{"order_number":"13dfb124","status":"Confirmed"},{"order_number":"f7268124","status":"Confirmed"},{"order_number":"8bdbd124","status":"Delivered"},{"order_number":"e3b60124","status":"Confirmation Pending"},{"order_number":"13e37124","status":"Confirmation Pending"},{"order_number":"0ea5e124","status":"Items Collected"},{"order_number":"50592124","status":"Confirmation Pending"},{"order_number":"66e54124","status":"Confirmation Pending"},{"order_number":"035b5124","status":"Confirmed"},{"order_number":"2c274124","status":"Confirmed"},{"order_number":"956fc124","status":"Confirmation Pending"},{"order_number":"865bd124","status":"Confirmation Pending"},{"order_number":"2bcb5124","status":"Confirmed"},{"order_number":"fca65124","status":"Confirmation Pending"},{"order_number":"dd663124","status":"Confirmation Pending"},{"order_number":"942ad124","status":"Confirmation Pending"},{"order_number":"048a8124","status":"Confirmed"},{"order_number":"0b597124","status":"Confirmation Pending"},{"order_number":"c4bbb124","status":"Confirmation Pending"},{"order_number":"06d35124","status":"Confirmation Pending"},{"order_number":"ffe78124","status":"Confirmation Pending"},{"order_number":"c7aad124","status":"Confirmation Pending"},{"order_number":"eb11c124","status":"Confirmation Pending"},{"order_number":"de9f9124","status":"Confirmation Pending"},{"order_number":"d53ce124","status":"Confirmation Pending"},{"order_number":"35232124","status":"Confirmation Pending"},{"order_number":"e07ee124","status":"Confirmed"},{"order_number":"74fe7124","status":"Confirmed"},{"order_number":"f9a76124","status":"Confirmed"},{"order_number":"9f962124","status":"Confirmation Pending"},{"order_number":"21d4a124","status":"Confirmation Pending"},{"order_number":"c8ec2124","status":"Confirmation Pending"},{"order_number":"a253b124","status":"Confirmed"},{"order_number":"d60c4124","status":"Confirmed"},{"order_number":"53761124","status":"Confirmed"},{"order_number":"2e08e124","status":"Confirmed"},{"order_number":"5afab124","status":"Confirmation Pending"},{"order_number":"3020d124","status":"Confirmation Pending"},{"order_number":"68b12124","status":"Confirmed"},{"order_number":"34bd2124","status":"Confirmation Pending"},{"order_number":"46958124","status":"Confirmed"},{"order_number":"f5195124","status":"Confirmation Pending"},{"order_number":"4b01a124","status":"Confirmed"},{"order_number":"86152124","status":"Confirmed"},{"order_number":"72202124","status":"Confirmation Pending"},{"order_number":"f6562124","status":"Confirmation Pending"},{"order_number":"924a8124","status":"Confirmed"},{"order_number":"e9c7e124","status":"Confirmation Pending"},{"order_number":"ae7c2124","status":"Confirmation Pending"},{"order_number":"ae95d124","status":"Confirmation Pending"},{"order_number":"14c23124","status":"Confirmation Pending"},{"order_number":"123e8124","status":"Items Collected"},{"order_number":"fb825124","status":"Confirmation Pending"},{"order_number":"793e3124","status":"Confirmation Pending"},{"order_number":"3be99124","status":"Confirmation Pending"},{"order_number":"35751124","status":"Confirmation Pending"},{"order_number":"84b96124","status":"Confirmation Pending"},{"order_number":"5b000124","status":"Confirmation Pending"},{"order_number":"ea836124","status":"Confirmation Pending"},{"order_number":"a6ff3124","status":"Confirmation Pending"},{"order_number":"3c284124","status":"Confirmation Pending"},{"order_number":"82808124","status":"Confirmed"},{"order_number":"2f567124","status":"Confirmation Pending"},{"order_number":"296d0124","status":"Confirmation Pending"},{"order_number":"133ff124","status":"Confirmation Pending"},{"order_number":"6c911124","status":"Delivered"},{"order_number":"3c5b1124","status":"Confirmed"},{"order_number":"e7b58124","status":"Confirmed"},{"order_number":"65cc2124","status":"Confirmation Pending"},{"order_number":"d2e9b124","status":"Confirmation Pending"},{"order_number":"6ebf8124","status":"Confirmation Pending"},{"order_number":"a8bb8124","status":"Confirmation Pending"},{"order_number":"62d10124","status":"Confirmation Pending"},{"order_number":"23c1d124","status":"Confirmation Pending"},{"order_number":"631ae124","status":"Confirmation Pending"},{"order_number":"f8a26124","status":"Confirmation Pending"},{"order_number":"24308124","status":"Confirmation Pending"},{"order_number":"0ce3a124","status":"Confirmed"},{"order_number":"8f256124","status":"Confirmation Pending"},{"order_number":"18bda124","status":"Confirmation Pending"},{"order_number":"855ef124","status":"Confirmation Pending"},{"order_number":"93c2b124","status":"Confirmed"},{"order_number":"2d142124","status":"Confirmation Pending"},{"order_number":"412df124","status":"Confirmation Pending"},{"order_number":"b8961124","status":"Confirmed"},{"order_number":"9a04b1223","status":"Confirmation Pending"},{"order_number":"402381223","status":"Confirmed"},{"order_number":"045bd1223","status":"Confirmed"},{"order_number":"4f9f71223","status":"Confirmation Pending"},{"order_number":"a27671223","status":"Confirmation Pending"},{"order_number":"670421223","status":"Confirmation Pending"},{"order_number":"39cf21223","status":"Confirmation Pending"},{"order_number":"b5f941223","status":"Confirmation Pending"},{"order_number":"f0cfa1223","status":"Confirmed"},{"order_number":"89b2e1223","status":"Confirmed"},{"order_number":"456cc1223","status":"Confirmation Pending"},{"order_number":"ffa571223","status":"Confirmation Pending"},{"order_number":"95dcc1223","status":"Confirmation Pending"},{"order_number":"6b6941223","status":"Confirmed"},{"order_number":"6b4d41223","status":"Confirmed"},{"order_number":"811531223","status":"Confirmation Pending"},{"order_number":"2057e1223","status":"Confirmation Pending"},{"order_number":"a41c31223","status":"Confirmation Pending"},{"order_number":"d691a1223","status":"Confirmation Pending"},{"order_number":"4ad971223","status":"Confirmed"},{"order_number":"9e4791223","status":"Confirmed"},{"order_number":"b07441223","status":"Confirmed"},{"order_number":"372361223","status":"Confirmed"},{"order_number":"3cd601223","status":"Confirmed"},{"order_number":"bd15b1223","status":"Confirmed"},{"order_number":"7204e1223","status":"Delivered"},{"order_number":"96d641223","status":"Confirmed"},{"order_number":"0b0ed1223","status":"Confirmed"},{"order_number":"b31c41223","status":"Confirmed"},{"order_number":"1c4e41223","status":"Confirmed"},{"order_number":"c6f0f1223","status":"Confirmation Pending"},{"order_number":"f273c1223","status":"Confirmation Pending"},{"order_number":"cb9c21223","status":"Confirmed"},{"order_number":"d0b0b1223","status":"Confirmed"},{"order_number":"765911223","status":"Confirmed"},{"order_number":"a3f9c1223","status":"Delivered"},{"order_number":"960791223","status":"Confirmation Pending"},{"order_number":"397b21223","status":"Confirmation Pending"},{"order_number":"e35e01223","status":"Confirmation Pending"},{"order_number":"99c831223","status":"Confirmation Pending"},{"order_number":"94b701223","status":"Confirmation Pending"},{"order_number":"bb0821223","status":"Confirmation Pending"},{"order_number":"e43721223","status":"Confirmation Pending"},{"order_number":"d15cb1223","status":"Items Collected"},{"order_number":"2878a1223","status":"Confirmation Pending"},{"order_number":"d52ae1223","status":"Confirmation Pending"},{"order_number":"b01d51223","status":"Confirmation Pending"},{"order_number":"c9b701223","status":"Confirmation Pending"},{"order_number":"792891223","status":"Confirmation Pending"},{"order_number":"b766a1223","status":"Confirmation Pending"},{"order_number":"1e3281223","status":"Confirmation Pending"},{"order_number":"33ec51223","status":"Confirmed"},{"order_number":"210dd1223","status":"Confirmed"},{"order_number":"7bd9a1223","status":"Confirmed"},{"order_number":"2a3981223","status":"Confirmed"},{"order_number":"1bdb41223","status":"Confirmed"},{"order_number":"13fc11223","status":"Confirmation Pending"},{"order_number":"00eb41223","status":"Confirmed"},{"order_number":"581551223","status":"Confirmation Pending"},{"order_number":"5f9df1223","status":"Confirmation Pending"},{"order_number":"33aff1223","status":"Confirmation Pending"},{"order_number":"a7dfd1223","status":"Confirmation Pending"},{"order_number":"dedb81223","status":"Confirmed"},{"order_number":"870171223","status":"Confirmed"},{"order_number":"3725b1123","status":"Confirmed"},{"order_number":"0556b1123","status":"Confirmed"},{"order_number":"d9fe01123","status":"Confirmed"},{"order_number":"20af61123","status":"Confirmed"},{"order_number":"5e9e81123","status":"Ready For Delivery"}]
/// message : "Order details"

ServiceOrderStatusModel serviceOrderStatusModelFromJson(String str) => ServiceOrderStatusModel.fromJson(json.decode(str));
String serviceOrderStatusModelToJson(ServiceOrderStatusModel data) => json.encode(data.toJson());
class ServiceOrderStatusModel {
  ServiceOrderStatusModel({
      this.status, 
      this.data, 
      this.message,});

  ServiceOrderStatusModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(OrderStatusData.fromJson(v));
      });
    }
    message = json['message'];
  }
  bool? status;
  List<OrderStatusData>? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}

/// order_number : "21a3b224"
/// status : "Confirmation Pending"

OrderStatusData dataFromJson(String str) => OrderStatusData.fromJson(json.decode(str));
String dataToJson(OrderStatusData data) => json.encode(data.toJson());
class OrderStatusData {
  OrderStatusData({
      this.orderNumber, 
      this.status,});

  OrderStatusData.fromJson(dynamic json) {
    orderNumber = json['order_number'];
    status = json['status'];
  }
  String? orderNumber;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_number'] = orderNumber;
    map['status'] = status;
    return map;
  }

}