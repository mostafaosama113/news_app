import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/network/local/cash_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitStates());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List screenList = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1 && sports.length == 0)
      getSports();
    else if (index == 2 && science.length == 0) getScience();

    emit(NewsBottomNavStates());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> search = [];
  List<dynamic> science = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingStates());
    DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': DioHelper.apiKey
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessStates());
      // print(value.data['articles'][1]['title']);
    }).catchError((onError) {
      print(onError);
      emit(NewsGetBusinessErrorStates(onError.toString()));
    });
  }

  void getSports() {
    emit(NewsGetSportsLoadingStates());
    DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': DioHelper.apiKey
      },
    ).then((value) {
      sports = value.data['articles'];
      emit(NewsGetSportsSuccessStates());
    }).catchError((onError) {
      print(onError);
      emit(NewsGetSportsErrorStates(onError.toString()));
    });
  }

  void getScience() {
    emit(NewsGetScienceLoadingStates());
    DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': DioHelper.apiKey
      },
    ).then((value) {
      science = value.data['articles'];
      emit(NewsGetScienceSuccessStates());
    }).catchError((onError) {
      print(onError);
      emit(NewsGetScienceErrorStates(onError.toString()));
    });
  }

  bool isDark = false;
  void init() {
    isDark = CashHelper.getData();
    if (isDark == null) isDark = false;
  }

  void toggleDarkMode() {
    isDark = !isDark;
    CashHelper.putData(isDark).then((value) {
      emit(ToggleDarkMode());
    });
  }

  void getSearch(String data) {
    emit(NewsGetScienceLoadingStates());
    search = [];
    DioHelper.getData(
      path: 'v2/everything',
      query: {
        'q': '$data',
        //'country': 'eg',
        //todo for test
        'apiKey': DioHelper.apiKey,
      },
    ).then((value) {
      search = value.data['articles'];
      emit(NewsSearchSuccessStates());
    }).catchError((onError) {
      print(onError);
      emit(NewsSearchErrorStates(onError.toString()));
    });
  }
}
