import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sherif_nxt_assessment/model/reservations_model/reservations.dart';
import 'package:sherif_nxt_assessment/model/reservations_model/rooms.dart';
import 'package:sherif_nxt_assessment/presentation/reservation_view/widgets/dottted_spertator.dart';
import 'package:sherif_nxt_assessment/presentation/reservation_view/widgets/rooms_widget_view/room_reservation.dart';

class RoomsListView extends StatelessWidget {
  const RoomsListView({
    super.key,
    required this.reservationItem,
  });

  final Reservations reservationItem;

  @override
  Widget build(BuildContext context) {
    // list for all the rooms reservations
    return ListView.separated(
      shrinkWrap: true,
      itemCount: reservationItem.stays!.first.rooms!.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      itemBuilder: (context, i) {
        final Rooms roomItem = reservationItem.stays!.first.rooms![i];
        return  Column(
          children: [
            const MySeparator(),
            SizedBox(
              height: 100.sp,
            ),
            // reservation item
            RoomReservation(room:roomItem,roomIndex: i),
            SizedBox(
              height: 100.sp,
            ),
            const MySeparator(),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}