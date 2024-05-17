import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sherif_nxt_assessment/core/utilities/constants.dart';
import 'package:sherif_nxt_assessment/model/reservations_model/reservations_model.dart';
import 'package:sherif_nxt_assessment/network/network_helper_http.dart';


class NetworkHelperMockHttp {
  final http.Client client;

  NetworkHelperMockHttp(this.client);

  Future<dynamic> get() async {
    var myHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${NetworkHelperHttp().accessToken}'
    };
    var response =  await client.get(Uri.parse(Constants.API),headers: myHeaders);
    if (response.statusCode == 200) {
      var json= jsonDecode(response.body);
      return  ReservationsModel.fromJson(json);
    } else {
      return "Error Acquired";
    }
  }


}