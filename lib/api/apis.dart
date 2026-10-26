import 'dart:convert';
import 'package:carvendor/api/utils.dart';
import 'package:carvendor/models/CommonModel.dart';
import 'package:carvendor/models/OrderModel.dart';
import 'package:http/http.dart' as http;
import '../../models/LoginModel.dart';
import '../../utilities/common.dart';
import 'constants.dart';
class Apis {
  final constant = ApiConstants();
  final utils = ApiUtils();
  Future<LoginModel?> Login(String phonenumber,String Password,String token) async {
    Map<String, String> params = {
      'Username': phonenumber,
      'Password': Password,
      'fcmToken': token,
    };
    final request = utils.createPostRequestWithParams(
        constant.verifyLoginUrl(), params);
    // request.headers.addAll(constant.getHeader());
    printLog(request);
    http.StreamedResponse response = await request.send();
    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return LoginModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }
    Future<OrderModel?> PendingData(String vendorid,) async {
      Map<String, String> params = {
        'venderId': vendorid,
      };
      final request = utils.createGetRequestWithParams(
          constant.pendingBookingUrl(), params);
      // request.headers.addAll(constant.getHeader());
      printLog(request);
      http.StreamedResponse response = await request.send();
      try {
        if (response.statusCode == 200) {
          final data = await response.stream.bytesToString();
          printLog(data);
          return OrderModel.fromJson(jsonDecode(data));
        } else {
          printLog(response.reasonPhrase);
          return null;
        }
      } catch (e) {
        printLog(e);
        return null;
      }
    }
      Future<OrderModel?> ProcessData(String vendorid,) async {
        /* Map<String, String> params = {
      'venderId':vendorid,
    };*/
        final request = utils.createGetRequest(
            constant.processBookingUrl() + '$vendorid/status/Processing');
        // request.headers.addAll(constant.getHeader());
        printLog(request);
        http.StreamedResponse response = await request.send();
        try {
          if (response.statusCode == 200) {
            final data = await response.stream.bytesToString();
            printLog(data);
            return OrderModel.fromJson(jsonDecode(data));
          } else {
            printLog(response.reasonPhrase);
            return null;
          }
        } catch (e) {
          printLog(e);
          return null;
        }
      }
        Future<OrderModel?> CompletedData(String vendorid,) async {
          /* Map<String, String> params = {
      'venderId':vendorid,
    };*/
          final request = utils.createGetRequest(
              constant.processBookingUrl() + '$vendorid/status/Complete');
          // request.headers.addAll(constant.getHeader());
          printLog(request);
          http.StreamedResponse response = await request.send();
          try {
            if (response.statusCode == 200) {
              final data = await response.stream.bytesToString();
              printLog(data);
              return OrderModel.fromJson(jsonDecode(data));
            } else {
              printLog(response.reasonPhrase);
              return null;
            }
          } catch (e) {
            printLog(e);
            return null;
          }
        }
          Future<CommonModel?> AcceptBookingRequest(String vendorid,String bookingid) async {
            Map<String, String> params = {
              'venderId': vendorid,
              'id': bookingid,
            };
            final request = utils.createPutRequestWithParams(
                constant.acceptBookingUrl(), params);
            // request.headers.addAll(constant.getHeader());
            printLog(request);
            http.StreamedResponse response = await request.send();
            try {
              if (response.statusCode == 200) {
                final data = await response.stream.bytesToString();
                printLog(data);
                return CommonModel.fromJson(jsonDecode(data));
              } else {
                printLog(response.reasonPhrase);
                return null;
              }
            } catch (e) {
              printLog(e);
              return null;
            }
          }
            Future<CommonModel?> StartTripRequest(String vendorid,String bookingid) async {
              Map<String, String> params = {
                'Vid': vendorid,
                'id': bookingid,
              };
              final request = utils.createPutRequestWithParams(
                  constant.startTripUrl(), params);
              // request.headers.addAll(constant.getHeader());
              printLog(request);
              http.StreamedResponse response = await request.send();
              try {
                if (response.statusCode == 200) {
                  final data = await response.stream.bytesToString();
                  printLog(data);
                  return CommonModel.fromJson(jsonDecode(data));
                } else {
                  printLog(response.reasonPhrase);
                  return null;
                }
              } catch (e) {
                printLog(e);
                return null;
              }
            }
              Future<CommonModel?> StopTripRequest(String vendorid,String bookingid,String tollprice,String totalkm,String totalPrice) async {
                Map<String, String> params = {
                  'Vid': vendorid,
                  'id': bookingid,
                  'tollPrice': tollprice,
                  'totalKM': totalkm,
                  'totalPrice': totalPrice
                };
                final request = utils.createPutRequestWithParams(
                    constant.stopTripUrl(), params);
                // request.headers.addAll(constant.getHeader());
                printLog(request);
                http.StreamedResponse response = await request.send();
                try {
                  if (response.statusCode == 200) {
                    final data = await response.stream.bytesToString();
                    printLog(data);
                    return CommonModel.fromJson(jsonDecode(data));
                  } else {
                    printLog(response.reasonPhrase);
                    return null;
                  }
                } catch (e) {
                  printLog(e);
                  return null;
                }
              }
                Future<CommonModel?> RejectBookingRequest(String vendorid,
                    String bookingid) async {
                  Map<String, String> params = {
                    'venderId': vendorid,
                    'id': bookingid,
                  };
                  final request = utils.createPutRequestWithParams(
                      constant.rejectBookingUrl(), params);
                  // request.headers.addAll(constant.getHeader());
                  printLog(request);
                  http.StreamedResponse response = await request.send();
                  try {
                    if (response.statusCode == 200) {
                      final data = await response.stream.bytesToString();
                      printLog(data);
                      return CommonModel.fromJson(jsonDecode(data));
                    } else {
                      printLog(response.reasonPhrase);
                      return null;
                    }
                  } catch (e) {
                    printLog(e);
                    return null;
                  }
                }
                  Future<CommonModel?> CancelBookingRequest(String vendorid,
                      String bookingid) async {
                    Map<String, String> params = {
                      'venderId': vendorid,
                      'id': bookingid,
                    };
                    final request = utils.createPutRequestWithParams(
                        constant.cancelBookingUrl(), params);
                    // request.headers.addAll(constant.getHeader());
                    printLog(request);
                    http.StreamedResponse response = await request.send();
                    try {
                      if (response.statusCode == 200) {
                        final data = await response.stream.bytesToString();
                        printLog(data);
                        return CommonModel.fromJson(jsonDecode(data));
                      } else {
                        printLog(response.reasonPhrase);
                        return null;
                      }
                    } catch (e) {
                      printLog(e);
                      return null;
                    }
                  }
                }
