import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/search_screen/search.dart';
import '../shared/componants.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context , state) {},
      builder: (context , state)
      {
        var cubit=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.brightness_4_outlined),
                onPressed: ()
                {
                  NewsCubit.get(context).ChangeAppMode();
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: ()
                {
                  NavigateTo(context, searchScreen());
                },
              ),
            ],
          ),
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNavIndex(index);
            },
            items: cubit.ButtomItems,

          ),
        );
      },
    );
  }
}
