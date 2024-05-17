import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sherif_nxt_assessment/core/shared_preference/sharedpref_helper.dart';
import '../../model/reservations_model/reservations_model.dart';
import '../utilities/constants.dart';

class SharedPrefCacheReservation {

  static SharedPrefCacheReservation? sharedPrefCacheReservation;


  // used shared pref for cache cause it is a simple
  static Future<void> cacheData(String data) async {
    SharedPref.saveData(key: Constants.cachedReservation, value: data);
  }

  // these to check if the cache is available if not then throe and expectation
  static Future<ReservationsModel> getCachedData() async {
    String? cachedData = SharedPref.getData(key: Constants.cachedReservation);
    if (cachedData != null) {
      var data = jsonDecode(cachedData);
      return ReservationsModel.fromJson(data);
    } else {
      Fluttertoast.showToast(
          msg: "No cached data and no internet connection. Please try again later.",
          toastLength: Toast.LENGTH_LONG,
          fontSize: 16.0);
      throw Exception("No cached data available");
    }
  }
}
