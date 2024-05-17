import 'package:flutter/material.dart';

import '../../../model/reservations_model/reservations.dart';
import '../../../model/reservations_model/reservations_model.dart';
import '../../../services/reservation_services.dart';


class GetsReservationProvider extends ChangeNotifier {
  ReservationsModel getAllReservation = ReservationsModel();
  List<Reservations>? reservationsList = [];


  // get the the reservation model  from services filled and fill the list
  // and notify any listeners  we have in the design that the list is not empty any more
  Future<List<Reservations>>  getAllReservationsProvider() async {
    try {
      final ReservationsModel? result = await GetReservationsServices().getInternetOrCacheReservation();
      reservationsList = result?.reservations;
      notifyListeners();
      return reservationsList!;
    } catch (error) {
      rethrow;
    }
  }

}
