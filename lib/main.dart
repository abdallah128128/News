import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/cache_helper.dart';
import 'package:news_app/shared/dio_helpre.dart';
import 'package:news_app/shared/themes.dart';
import 'layout/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark');

  BlocOverrides.runZoned(
    () {
      // Use cubits...
      runApp(MyApp(
        isDark: isDark,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  MyApp({
    this.isDark,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..ChangeAppMode(fromShared: isDark)
        ..GetBusiness()
        ..Getsports()
        ..Getscience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: LightMode,
            darkTheme: DarkMode,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
