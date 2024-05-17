import 'package:flutter/material.dart';
import 'package:sherif_nxt_assessment/core/shared_preference/sharedpref_helper.dart';
import 'package:sherif_nxt_assessment/core/utilities/constants.dart';


class ThemeViewModel extends ChangeNotifier{
 bool? isDark; // true => dark , false => light
 void changeTheme(value){
   isDark = value;
   SharedPref.saveData(key: Constants.isDark, value: isDark);
   notifyListeners();
 }
 bool? get getTheme{
   return isDark;
 }
 ThemeViewModel(bool isThemeDark){
   isDark = isThemeDark;
 }
}