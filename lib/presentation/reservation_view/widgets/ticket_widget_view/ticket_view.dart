import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sherif_nxt_assessment/core/global_widgets/clip_oval_image.dart';
import 'package:sherif_nxt_assessment/model/reservations_model/user_tickets.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../../../../model/reservations_model/reservations.dart';
import '../title_display_widget.dart';
import 'custom_rich_text.dart';

class TicketView extends StatelessWidget {
  const TicketView({
    super.key,
    required this.screenWidth,
    required this.screenHeight, required this.reservationItem, required this.tickets,
  });

  final double screenWidth;
  final double screenHeight;
  final Reservations reservationItem;
  final UserTickets tickets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50.0.sp, right: 50.0.sp),
      child: TicketWidget(
          width: screenWidth,
          height: screenHeight * 0.24,
          color: Theme.of(context).colorScheme.secondary,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Clip oval widget to give Image the circular design we need
                  ClipOvalImage(url:tickets.ticketUserData!.avatar! ,width:120.sp,height:120.sp),
                  SizedBox(
                    width: 20.sp,
                  ),
                TitleDisplayWidget(
                      title: "${tickets.ticketUserData!.firstName!} ${tickets.ticketUserData!.lastName!}",
                      desc: "#${tickets.ticketId}")
                ],
              ),
              SizedBox(
                height: 40.sp,
              ),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 2.0,
                height: 10,
              ),
               CustomRichWidget(title: "Ticket Type: ",desc: "${tickets.ticketTypeName}"),
            CustomRichWidget(title: "Seat: ",desc: "gate ${tickets.gate} / seat ${tickets.seat}"),
            ],
          )),
    );
  }
}