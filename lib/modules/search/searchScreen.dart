import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_preoject/layout/cubit/cubit.dart';
import 'package:second_preoject/layout/cubit/states.dart';
import 'package:second_preoject/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
  var searchController= TextEditingController();
  var testKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,NewStates>(
      listener: (context,state){},
      builder: (context,state){
        var list= AppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: testKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller:searchController ,
                    decoration: InputDecoration(
                      label: Text('Search'),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                    ),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return('Search is empty');
                      }
                    },
                    onFieldSubmitted: (value){
                      testKey.currentState!.validate();
                    },
                    onChanged: (value){
                      AppCubit.get(context).getSearch(value);
                    },
                  ) ,
                ),
                Expanded(child: buildarticle(list))
              ],
            ),
          ),
        );
      }
    ) ;
  }
}
