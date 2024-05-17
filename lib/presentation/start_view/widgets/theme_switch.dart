import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sherif_nxt_assessment/core/theme/color_palete.dart';
import 'package:sherif_nxt_assessment/core/theme/provider_theme/change_theme/theme_view_model.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ValueNotifier<bool>(false);
    return Padding(
      padding: EdgeInsets.only(left: 60.sp, right: 60.sp),
      child: Consumer<ThemeViewModel>(builder: (context, viewModel, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/vectors/Theme.svg',
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primaryContainer,
                      BlendMode.srcIn),
                ),
                SizedBox(
                  width: 14.sp,
                ),
                Text(
                  'Theme',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            AdvancedSwitch(
              key: const Key('changeTheme'),
              controller: controller,
              activeColor: secondaryWhite,
              inactiveColor: secondaryGray,
              activeChild: SvgPicture.asset('assets/vectors/eclipse.svg'),
              inactiveChild:
                  SvgPicture.asset('assets/vectors/vector_29_x2.svg'),
              width: 80.0,
              height: 30.0,
              enabled: true,
              initialValue: viewModel.getTheme!,
              onChanged: viewModel.changeTheme,
              thumb: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: primaryBlack,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x24000000),
                      offset: Offset(0, 1),
                      blurRadius: 0.5,
                    ),
                    BoxShadow(
                      color: Color(0x1A000000),
                      offset: Offset(0, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: SizedBox(
                  width: 24.sp,
                  height: 24.sp,
                ),
              ),
              disabledOpacity: 0.5,
            ),
          ],
        );
      }),
    );
  }
}
