class OrderModel {
  List<OrderData>? data;
  bool? status;

  OrderModel({this.data, this.status});

  OrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OrderData>[];
      json['data'].forEach((v) {
        data!.add(new OrderData.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class OrderData {
  int? id;
  String? customerId;
  String? customerName;
  String? customerMob;
  String? noOfPassenger;
  String? description;
  String? busId;
  String? seater;
  String? type;
  String? isAc;
  String? typeOfTrip;
  List<String>? destinations;
  dynamic venderId;
  dynamic venderBusId;
  dynamic driverName;
  dynamic driverMob;
  dynamic driverLicence;
  dynamic driverPhoto;
  dynamic busNoPlate;
  String? fromPlace;
  String? toPlace;
  String? fromDate;
  String? toDate;
  String? totalDate;
  dynamic pickUpPlace;
  dynamic dropPlace;
  dynamic startKM;
  dynamic endKM;
  dynamic totalKM;
  String? expectedtotalKM;
  String? perKMPrice;
  String? perDayPrice;
  dynamic tollPrice;
  String? totalPrice;
  dynamic startTime;
  String? endTime;
  String? startState;
  String? destinationState;
  String? borderChanges;
  String? advanceAmount;
  String? advanceAmountTransactionId;
  String? pendingAmount;
  String? isFullPaymentPaid;
  String? isVenderAllocated;
  String? isVenderAcceptedBooking;
  String? bookingStatus;
  String? photo;
  String? isActive;
  String? createAt;
  String? updateAt;
  dynamic createdBy;
  String? updatedBy;
  String? latitude;
  String? longitude;
  String? isTripStarted;
  String? busName;
  String? busDetails;

  OrderData({this.id,
    this.customerId,
    this.customerName,
    this.customerMob,
    this.noOfPassenger,
    this.description,
    this.busId,
    this.seater,
    this.type,
    this.isAc,
    this.typeOfTrip,
    this.destinations,
    this.venderId,
    this.venderBusId,
    this.driverName,
    this.driverMob,
    this.driverLicence,
    this.driverPhoto,
    this.busNoPlate,
    this.fromPlace,
    this.toPlace,
    this.fromDate,
    this.toDate,
    this.totalDate,
    this.pickUpPlace,
    this.dropPlace,
    this.startKM,
    this.endKM,
    this.totalKM,
    this.expectedtotalKM,
    this.perKMPrice,
    this.perDayPrice,
    this.tollPrice,
    this.totalPrice,
    this.startTime,
    this.endTime,
    this.startState,
    this.destinationState,
    this.borderChanges,
    this.advanceAmount,
    this.advanceAmountTransactionId,
    this.pendingAmount,
    this.isFullPaymentPaid,
    this.isVenderAllocated,
    this.isVenderAcceptedBooking,
    this.bookingStatus,
    this.photo,
    this.isActive,
    this.createAt,
    this.updateAt,
    this.createdBy,
    this.updatedBy,
    this.latitude,
    this.longitude,
    this.isTripStarted,
    this.busName,
    this.busDetails
  });

  OrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customerId'];
    customerName = json['customerName'];
    customerMob = json['customerMob'];
    noOfPassenger = json['noOfPassenger'];
    description = json['description'];
    busId = json['busId'];
    seater = json['seater'];
    type = json['type'];
    isAc = json['isAc'];
    typeOfTrip = json['typeOfTrip'];
    destinations = json['destinations'] != null
        ? (json['destinations'] as List).map((e) => e.toString()).toList()
        : null;
    venderId = json['venderId'];
    venderBusId = json['venderBusId'];
    driverName = json['driverName'];
    driverMob = json['driverMob'];
    driverLicence = json['driverLicence'];
    driverPhoto = json['driverPhoto'];
    busNoPlate = json['busNoPlate'];
    fromPlace = json['fromPlace'];
    toPlace = json['toPlace'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    totalDate = json['totalDate'];
    pickUpPlace = json['pickUpPlace'];
    dropPlace = json['dropPlace'];
    startKM = json['startKM'];
    endKM = json['endKM'];
    totalKM = json['totalKM'];
    expectedtotalKM = json['expectedtotalKM'];
    perKMPrice = json['perKMPrice'];
    perDayPrice = json['perDayPrice'];
    tollPrice = json['tollPrice'];
    totalPrice = json['totalPrice'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    startState = json['startState'];
    destinationState = json['destinationState'];
    borderChanges = json['borderChanges'];
    advanceAmount = json['advanceAmount'];
    advanceAmountTransactionId = json['advanceAmountTransactionId'];
    pendingAmount = json['pendingAmount'];
    isFullPaymentPaid = json['isFullPaymentPaid'];
    isVenderAllocated = json['isVenderAllocated'];
    isVenderAcceptedBooking = json['isVenderAcceptedBooking'];
    bookingStatus = json['bookingStatus'];
    photo = json['photo'];
    isActive = json['isActive'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isTripStarted = json['isTripStarted'];
    busName = json['busName'];
    busDetails = json['busDetails'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customerId'] = this.customerId;
    data['customerName'] = this.customerName;
    data['customerMob'] = this.customerMob;
    data['noOfPassenger'] = this.noOfPassenger;
    data['description'] = this.description;
    data['busId'] = this.busId;
    data['seater'] = this.seater;
    data['type'] = this.type;
    data['isAc'] = this.isAc;
    data['typeOfTrip'] = this.typeOfTrip;
    data['destinations'] = this.destinations;
    data['venderId'] = this.venderId;
    data['venderBusId'] = this.venderBusId;
    data['driverName'] = this.driverName;
    data['driverMob'] = this.driverMob;
    data['driverLicence'] = this.driverLicence;
    data['driverPhoto'] = this.driverPhoto;
    data['busNoPlate'] = this.busNoPlate;
    data['fromPlace'] = this.fromPlace;
    data['toPlace'] = this.toPlace;
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    data['totalDate'] = this.totalDate;
    data['pickUpPlace'] = this.pickUpPlace;
    data['dropPlace'] = this.dropPlace;
    data['startKM'] = this.startKM;
    data['endKM'] = this.endKM;
    data['totalKM'] = this.totalKM;
    data['expectedtotalKM'] = this.expectedtotalKM;
    data['perKMPrice'] = this.perKMPrice;
    data['perDayPrice'] = this.perDayPrice;
    data['tollPrice'] = this.tollPrice;
    data['totalPrice'] = this.totalPrice;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['startState'] = this.startState;
    data['destinationState'] = this.destinationState;
    data['borderChanges'] = this.borderChanges;
    data['advanceAmount'] = this.advanceAmount;
    data['advanceAmountTransactionId'] = this.advanceAmountTransactionId;
    data['pendingAmount'] = this.pendingAmount;
    data['isFullPaymentPaid'] = this.isFullPaymentPaid;
    data['isVenderAllocated'] = this.isVenderAllocated;
    data['isVenderAcceptedBooking'] = this.isVenderAcceptedBooking;
    data['bookingStatus'] = this.bookingStatus;
    data['photo'] = this.photo;
    data['isActive'] = this.isActive;
    data['createAt'] = this.createAt;
    data['updateAt'] = this.updateAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['isTripStarted'] = this.isTripStarted;
    data['busName'] = this.busName;
    data['busDetails'] = this.busDetails;
    return data;
  }
}