import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_preoject/layout/cubit/cubit.dart';
import 'package:second_preoject/layout/cubit/states.dart';
import 'package:second_preoject/modules/search/searchScreen.dart';
import 'package:second_preoject/network/remote/dio_helper.dart';
import 'package:second_preoject/shared/components/components.dart';

class NewLayout extends StatelessWidget {
  const NewLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
        return BlocConsumer<AppCubit,NewStates>(
          listener: (context,state){},
          builder: (context,state){
            var cubit= AppCubit.get(context);
            return Scaffold(
            appBar: AppBar(
              title: const Text('NewsApp'),
              actions:
              [
                IconButton(onPressed: (){navigateTo(context, SearchScreen());},
                    icon: const Icon(Icons.search)
                ),
                IconButton(
                    onPressed: (){
                      AppCubit.get(context).changeMode();
                    },
                    icon: const Icon(Icons.brightness_4_outlined)
                )
              ],

            ),
            bottomNavigationBar: BottomNavigationBar(
              items:cubit.items,
              currentIndex: cubit.currentIndex,
              onTap: (value){
                cubit.changeIndex(value);
              },
            ),
              body: cubit.screen[cubit.currentIndex],
          );}
        );
  }
}
