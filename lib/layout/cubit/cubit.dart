import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_preoject/layout/cubit/states.dart';
import 'package:second_preoject/modules/business/businessScreen.dart';
import 'package:second_preoject/modules/science/scienceScreen.dart';
import 'package:second_preoject/modules/settings/settingsScreen.dart';
import 'package:second_preoject/modules/sport/sportScreen.dart';
import 'package:second_preoject/network/local/cachehelper.dart';
import 'package:second_preoject/network/remote/dio_helper.dart';

class AppCubit extends Cubit<NewStates>{
  AppCubit() : super(NewInitialState());
  static AppCubit get(context)=> BlocProvider.of(context);
  int currentIndex =0;
  List<BottomNavigationBarItem> items=[
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
  ];
  List<Widget> screen=[
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  void changeIndex(int index)
  {
    currentIndex=index;
    if(index==1)
      {
        getSports();
      }
    else if(index==2)
      {
        getScience();
      }
    emit(NewBotNavState());
  }

  List<dynamic> business=[];
  List<dynamic> sports=[];
  List<dynamic> science=[];
  List<dynamic> search=[];


  void getBusiness()
  {
    emit(NewLoadingDataState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {'country':'eg','category':'business','apiKey':'65f7f556ec76449fa7dc7c0069f040ca'}
    ).then((value)
    {
      business= value.data['articles'];
      emit(NewBusinessDataState());
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(NewBusinessErrorDataState(error.toString()));
    }
    );
  }

  void getSports()
  {
    emit(NewLoadingDataState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {'country':'eg','category':'sports','apiKey':'65f7f556ec76449fa7dc7c0069f040ca'}
    ).then((value)
    {
      sports= value.data['articles'];
      emit(NewSportsDataState());
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(NewSportErrorDataState(error.toString()));
    }
    );
  }

  void getScience()
  {
    emit(NewLoadingDataState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {'country':'eg','category':'science','apiKey':'65f7f556ec76449fa7dc7c0069f040ca'}
    ).then((value)
    {
      science= value.data['articles'];
      emit(NewScienceDataState());
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(NewScienceErrorDataState(error.toString()));
    }
    );
  }

  void getSearch(String value)
  {
    emit(NewLoadingDataState());
    DioHelper.getData(
        url: 'v2/everything',
        query: {'q':value,'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'}
    ).then((value)
    {
      search= value.data['articles'];
      emit(NewSearchDataState());
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(NewSearchErrorDataState(error.toString()));
    }
    );
  }

  bool isDark=false;
  void changeMode( {bool? fromShared})
  {
    if(fromShared!=null)
      isDark = fromShared ;
    else
        isDark= !isDark;
        CacheHelper.putbool(key: 'isDark', value: isDark).then((value) =>
            emit(ChangeModeState()));
  }



  }