import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/provider_theme/change_theme/theme_view_model.dart';
import '../../../model/reservations_model/reservations.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key, required this.reservationItem,
  });
  final Reservations reservationItem;
  @override
  Widget build(BuildContext context) {
    final themeViewModel = Provider.of<ThemeViewModel>(context, listen: false);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 50.0.sp, right: 20.0.sp,bottom: 15.sp),
          child: Text(
            'Location:',
            style: Theme.of(context).textTheme.displayLarge!,
          ),
        ),
        Container(
          color: Theme.of(context).colorScheme.secondary,
          padding:  EdgeInsets.fromLTRB(50.0.sp, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints:  BoxConstraints(
                  maxWidth: 400.sp, // Set the maximum width to 200
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${reservationItem.stays?.first.name}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.displayLarge!,
                    ),
                   SizedBox(height: 10.sp,),
                    Text(
                      'Address: ${"${reservationItem.stays?.first.address}"}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                  ],
                ),
              ),
              Container(
                width: 300.sp,
                height: 300.sp,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      // to get the light map design or the dark map design
                      themeViewModel.getTheme! ?'assets/images/white map.png': 'assets/images/rectangle_83.png',
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5.5, 44.8, 0, 44.2),
                  child: SvgPicture.asset(
                    'assets/vectors/subtract_x2.svg',
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}