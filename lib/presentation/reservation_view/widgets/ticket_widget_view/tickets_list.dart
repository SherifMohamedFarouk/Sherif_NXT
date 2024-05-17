import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sherif_nxt_assessment/model/reservations_model/reservations.dart';
import 'package:sherif_nxt_assessment/model/reservations_model/user_tickets.dart';
import 'package:sherif_nxt_assessment/presentation/reservation_view/widgets/ticket_widget_view/ticket_view.dart';
class TicketsList extends StatelessWidget {
  const TicketsList({
    super.key,
    required this.reservationItem,
    required this.screenWidth,
    required this.screenHeight,
  });

  final Reservations reservationItem;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 50.0.sp, right: 20.0.sp,bottom: 15.sp),
          child: Text(
            'Tickets:',
            style: Theme.of(context).textTheme.displayLarge!,
          ),
        ),
        // list for all the tickets to show the users
        ListView.separated(
          shrinkWrap: true,
          itemCount: reservationItem.userTickets!.length,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          itemBuilder: (context, i) {
            final UserTickets ticketItem = reservationItem.userTickets![i];
            return  TicketView(screenWidth: screenWidth, screenHeight: screenHeight,reservationItem: reservationItem,tickets:ticketItem);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        ),
      ],
    );
  }
}