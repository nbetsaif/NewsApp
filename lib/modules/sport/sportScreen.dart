import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_preoject/layout/cubit/cubit.dart';
import 'package:second_preoject/layout/cubit/states.dart';
import 'package:second_preoject/shared/components/components.dart';
class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,NewStates>(
      listener: (context,state){},
      builder: (context,state){
        var list=AppCubit.get(context).sports;

        return buildarticle(list);
      } ,
    );
  }
}
