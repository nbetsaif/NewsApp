import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:second_preoject/layout/cubit/cubit.dart';
import 'package:second_preoject/layout/newLayout.dart';
import 'package:second_preoject/network/local/cachehelper.dart';
import 'package:second_preoject/network/remote/dio_helper.dart';

import 'layout/cubit/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
   bool? isDark=CacheHelper.getdata(key: 'isDark');
  runApp(  MyApp( isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context){

          return  AppCubit()..changeMode(fromShared: isDark)..getBusiness();
        },
            child: BlocConsumer<AppCubit,NewStates>(
              listener: (context,state){},
              builder: (context,state){
                return MaterialApp(
                themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
                darkTheme: ThemeData(
          primarySwatch: Colors.deepOrange,
          appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.white
          ),
          actionsIconTheme: IconThemeData(
          color: Colors.white
          ),
          elevation: 0,
          backgroundColor: HexColor('333739'),
          systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739') ,
          statusBarIconBrightness: Brightness.light
          )
          ),
          scaffoldBackgroundColor: HexColor('333739'),
          bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739'),
    type: BottomNavigationBarType.fixed,
    elevation: 3,
    showUnselectedLabels: true,
    unselectedItemColor: Colors.grey,
    unselectedLabelStyle: TextStyle(color: Colors.black54),
    selectedItemColor: Colors.deepOrange,
    )
    ),
                theme: ThemeData(
                  primarySwatch: Colors.deepOrange,
                  appBarTheme:const AppBarTheme(
                      titleTextStyle: TextStyle(fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                      iconTheme: IconThemeData(color: Colors.black),
                      actionsIconTheme: IconThemeData(
                        color: Colors.black,
                      ),
                      elevation: 0,
                      backgroundColor: Colors.white,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Colors.white,
                          statusBarIconBrightness: Brightness.dark
                      )
                  ),
                  scaffoldBackgroundColor: Colors.white,
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    elevation: 3,
                    showUnselectedLabels: true,
                    unselectedItemColor: Colors.black54,
                    unselectedLabelStyle: TextStyle(color: Colors.black54),
                    selectedItemColor: Colors.deepOrange,
                    backgroundColor: Colors.white,
                  )
                  ),
                  title: 'SecondApp',
                  debugShowCheckedModeBanner: false,
                  home: NewLayout(),
          );
          },
            ),
    );
  }
}

