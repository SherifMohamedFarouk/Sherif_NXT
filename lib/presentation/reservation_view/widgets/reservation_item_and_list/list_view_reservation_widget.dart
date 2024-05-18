import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sherif_nxt_assessment/core/global_widgets/clip_oval_image.dart';
import 'package:sherif_nxt_assessment/model/reservations_model/reservations.dart';
import 'package:sherif_nxt_assessment/presentation/reservation_view/widgets/reservation_item_and_list/reservation_item.dart';

import '../../../start_view/provider/provider_reservation.dart';

class ListViewReservationWidget extends StatelessWidget {
  const ListViewReservationWidget({
    super.key,
    required this.getRegister,
    required this.screenWidth,
    required this.screenHeight,
  });

  final GetsReservationProvider getRegister;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: getRegister.reservationsList!.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      itemBuilder: (context, i) {
        final Reservations reservationItem = getRegister.reservationsList![i];
        // expandable to get the feel of expanded and closed widget in the design
        return  Expandable(
          key: Key("reservation$i"),
            arrowLocation:ArrowLocation.left ,
            backgroundColor:Theme.of(context).colorScheme.onPrimary,
            arrowWidget:  Icon(Icons.keyboard_arrow_up,color: Theme.of(context).colorScheme.primaryContainer,),
            firstChild:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    reservationItem.stays?.first.name??"Hotel Name",
                    style: Theme.of(context).textTheme.displayLarge!,
                  ),
                  SizedBox(
                    width: screenWidth*0.45,
                  ),
                  //Clip oval widget to give Image the circular design we need
                  ClipOvalImage(url:reservationItem.userTickets?.first.ticketUserData!.avatar ,width:120.sp,height:120.sp),
                  SizedBox(
                    width: 20.sp,
                  ),
                ],
              ),
            ),
            secondChild: ReservationItem(
                screenWidth: screenWidth, screenHeight: screenHeight,reservationItem:reservationItem));
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}