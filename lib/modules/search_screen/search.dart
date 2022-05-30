import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/componants.dart';

class searchScreen extends StatelessWidget {
   searchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates >(
      listener: (context , state){},
      builder: (context , state)
      {
        var List = NewsCubit.get(context).Search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Container(

                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 80,
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.all(20.0),
                child: MyFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onchange: (value)
                  {
                    NewsCubit.get(context).GetSearch(value);
                  },
                  validate: (String? value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'value must not be empty' ;
                    }
                    return null;
                  },
                  label: 'Search',
                  prefix: Icons.search ,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
              ),
              Expanded(child: NewsBuilder(List, context,isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
