
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sherif_nxt_assessment/core/theme/provider_theme/change_theme/theme_view_model.dart';
import 'package:sherif_nxt_assessment/presentation/start_view/provider/provider_reservation.dart';
import '../shared_preference/sharedpref_helper.dart';
import '../utilities/constants.dart';


abstract class ProviderList{
  static List<SingleChildWidget>  listOfProviders = [
    ChangeNotifierProvider<ThemeViewModel>(create: (BuildContext){
      return ThemeViewModel(SharedPref.getData(key: Constants.isDark) ?? false);
    },),
    ChangeNotifierProvider.value(value: GetsReservationProvider()),
  ];
}