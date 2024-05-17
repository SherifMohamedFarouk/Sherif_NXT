
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sherif_nxt_assessment/core/utilities/theme/provider_theme/change_theme/theme_view_model.dart';
import '../shared_preference/sharedpref_helper.dart';
import '../utilities/constants.dart';


abstract class ProviderList{
  static List<SingleChildWidget>  listOfProviders = [
    ChangeNotifierProvider<ThemeViewModel>(create: (BuildContext){
      return ThemeViewModel(SharedPref.getData(key: Constants.isDark) ?? false);
    },),
];
}