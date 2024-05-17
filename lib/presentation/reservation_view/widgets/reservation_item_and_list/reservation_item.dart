import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sherif_nxt_assessment/model/reservations_model/reservations.dart';
import 'package:sherif_nxt_assessment/presentation/reservation_view/widgets/ticket_widget_view/tickets_list.dart';
import 'package:sherif_nxt_assessment/presentation/reservation_view/widgets/title_display_widget.dart';
import '../desc_widget.dart';
import '../gallary_widget.dart';
import '../location_widget.dart';
import '../rooms_widget_view/rooms_list_view.dart';

class ReservationItem extends StatelessWidget {
  const ReservationItem({super.key, required this.screenWidth, required this.screenHeight, required this.reservationItem});

  final double screenWidth,screenHeight;
  final Reservations reservationItem;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
       DescWidget(reservationItem: reservationItem),
        SizedBox(
          height: 100.sp,
        ),
        // location widget to show the address of the hotel
        Padding(
          padding: EdgeInsets.only(left: 50.0.sp, right: 50.0.sp),
          child: LocationWidget(reservationItem: reservationItem),
        ),
        SizedBox(
          height: 100.sp,
        ),

        // to check if there are tickets available or not
        if(reservationItem.userTickets!=null&&reservationItem.userTickets!.isNotEmpty)...[
          TicketsList(reservationItem: reservationItem, screenWidth: screenWidth, screenHeight: screenHeight)
        ] else...[
          Padding(
            padding: EdgeInsets.only(left: 50.0.sp, right: 20.0.sp,bottom: 15.sp),
            child: Text(
              'Account has no tickets',
              style: Theme.of(context).textTheme.displayLarge!,
            ),
          ),
        ],
        SizedBox(
          height: 100.sp,
        ),
        if(reservationItem.stays?.first.rooms!=null&& reservationItem.stays!.first.rooms!.isNotEmpty)...[
          RoomsListView(reservationItem: reservationItem),
        ],
        SizedBox(
          height: 100.sp,
        ),
      GalleryWidget(reservationItem: reservationItem),
        SizedBox(
          height: 100.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.0.sp, right: 20.0.sp),
          child:  TitleDisplayWidget(
              title: "Amenities",
              desc: "${reservationItem.stays?.first.amenities!}"),
        ),
        SizedBox(
          height: 100.sp,
        ),
      ],
    );
  }
}


