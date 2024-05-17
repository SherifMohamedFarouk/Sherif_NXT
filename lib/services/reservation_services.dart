import 'dart:convert';
import 'package:sherif_nxt_assessment/core/shared_preference/sharedpref_cache_reservation.dart';
import 'package:sherif_nxt_assessment/model/reservations_model/reservations_model.dart';
import '../network/network_helper_http.dart';

class GetReservationsServices {

  // function to get all the services from the api NetworkHelperHttp
  // and put it in the cache instead needed and turn it to our model
  Future getAllReservations() async {
    try {
      final result = await NetworkHelperHttp().get("/mobile-guests/user-events");
      await SharedPrefCacheReservation.cacheData(result);
      var data = jsonDecode(result);
      return ReservationsModel.fromJson(data);
    } catch (error) {
      rethrow;
    }
  }

  //  this function is just simple wat to get the cash if the internet is not available
  Future getInternetOrCacheReservation() async {
    //check internet availability
    final bool noInternet = await NetworkHelperHttp().checkConnectivity();
    if(noInternet){
      try {
        // get the cache for shared pref
        ReservationsModel reservation = await SharedPrefCacheReservation
            .getCachedData();
        return reservation ;
      } catch (error) {
        rethrow;
      }
    }else{
      // internet is available
     return await getAllReservations();
    }
  }

}