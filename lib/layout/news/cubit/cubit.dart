import 'package:data_mans/layout/news/cubit/states.dart';
import 'package:data_mans/modules/business/business_Screen.dart';
import 'package:data_mans/modules/science/science_Screen.dart';
import 'package:data_mans/modules/settings/settings_Screen.dart';
import 'package:data_mans/modules/sports/sports_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsinitialStates());
  static NewsCubit get(context) => BlocProvider.of(context);
  int current_index = 0;
  List<BottomNavigationBarItem> BottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'science',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'settings',
    ),

  ];
  List<Widget> Screens = [
    BusinessScreen(),
    sportsScreen(),
    scienceScreen(),
    settingsScreen(),
  ];
  void changeBottomNavBar(index) {
    current_index = index;
    emit(NewsBottomNavStates());
  }
}
