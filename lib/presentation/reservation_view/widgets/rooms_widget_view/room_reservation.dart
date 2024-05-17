import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sherif_nxt_assessment/model/reservations_model/guests.dart';
import 'package:sherif_nxt_assessment/model/reservations_model/rooms.dart';
import 'package:sherif_nxt_assessment/presentation/reservation_view/widgets/title_display_widget.dart';


import '../desc_row_widgets.dart';

class RoomReservation extends StatelessWidget {
  const RoomReservation({super.key, required this.room, required this.roomIndex});

  final Rooms room;
  final int  roomIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 50.0.sp, right: 20.0.sp),
          child: Text(
            'Room Reservation ${roomIndex+1}',
            style: Theme.of(context).textTheme.displayLarge!,
          ),
        ),
        SizedBox(
          height: 80.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.0.sp, right: 20.0.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.sp,
              ),
              Text(
                'Guest(s):',
                style: Theme.of(context).textTheme.displayLarge!,
              ),
              SizedBox(
                height: 20.sp,
              ),
              // list to get all the rooms guests images
              ListView.builder(
                shrinkWrap: true,
                itemCount: room.guests?.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                itemBuilder: (context, i) {
                  final Guests  guestsItem = room.guests![i];
                  return  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: guestsItem.avatar!??"https://res.cloudinary.com/swtchcc/image/upload/c_scale,w_2800/ar_3:4,c_thumb,g_face,h_1512,z_0.80/v1682589758/userDocs/hvzsye0h3w8f6ud1cuwj.jpg",
                            placeholder: (context, url) => Image.asset('assets/images/place-holder.jpg'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.sp,
                      ),
                      Text(
                        '${guestsItem.firstName} ${guestsItem.lastName}',
                        style: Theme.of(context).textTheme.displayMedium!,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 30.sp,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 80.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.0.sp, right: 20.0.sp),
          child:  TitleDisplayWidget(
              title: "Room Type", desc: "${room.roomTypeName}"),
        ),
        SizedBox(
          height: 80.sp,
        ),
         DescRowWidgets(
          title1: "Room Number",
          title2: "Sleeps",
          desc1: "${room.roomNumber}",
          desc2:  "${room.roomCapacity}",
        ),
      ],
    );
  }
}
