import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/componants.dart';


class BussinessScreen extends StatelessWidget {
  const BussinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit ,NewsStates>(
      listener: (context , state) {},
      builder: (context , state) {
        var List = NewsCubit.get(context).business;
        return  NewsBuilder(List,context);
      },
    );
  }
}
