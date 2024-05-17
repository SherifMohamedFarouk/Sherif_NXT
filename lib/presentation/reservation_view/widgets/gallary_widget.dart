import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/reservations_model/reservations.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({super.key, required this.reservationItem});

  final Reservations reservationItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.0.sp, right: 50.0.sp),
          child: Text(
            'Gallery:',
            style: Theme.of(context).textTheme.displayLarge!,
          ),
        ),
        SizedBox(
          height: 20.sp,
        ),
        // to display all the images from the hotel with carousal slider package
        Padding(
          padding: EdgeInsets.only(
            left: 50.0.sp,
          ),
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
            ),
            items: reservationItem.stays?.first.stayImages!
                .map((item) => Padding(
                    padding: EdgeInsets.only(left: 5.0.sp, right: 5.0.sp),
                    child: CachedNetworkImage(
                      imageUrl: item,
                      placeholder: (context, url) =>
                          Image.asset('assets/images/rectangle_37.jpeg'),
                      fit: BoxFit.fill,
                    )))
                .toList(),
          ),
        ),
      ],
    );
  }
}
