import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/business_screen/business.dart';
import '../../modules/science_screen/science.dart';
import '../../modules/sports_screen/sports.dart';
import '../../shared/cache_helper.dart';
import '../../shared/dio_helpre.dart';
import 'states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(initialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> ButtomItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
  ];

  void changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(changeBottomNavState());
  }

  List<Widget> Screens = [
    BussinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
//--------------------------------------------------------------------
  List<dynamic> business = [];
  void GetBusiness() {
    emit(NewsBusinessLoadingState());
    if (business.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '90fbed64c13a4a8281c3197b389dd8d5',
        },
      ).then((value)
      {
        emit(NewsBusinessGetSuccessState());
        business =value.data['articles'];
      }).catchError((erorr)
      {
        print(erorr.toString());
        emit(NewsBusinessGetErrorState(erorr));
      });
    }else
      {
        emit(NewsBusinessGetSuccessState());
      }
  }
//--------------------------------------------------------------------
  List<dynamic> sports = [];
  void Getsports() {
    emit(NewssportsLoadingState());

    if(sports.length == 0)
    {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '90fbed64c13a4a8281c3197b389dd8d5',
        },
      ).then((value) {
        //print(value.data['articles'][0]['author'].toString());
        sports = value.data['articles'];
        print(sports[0]['title']);

        emit(NewssportsGetSuccessState());
      }).catchError((erorr) {
        print(erorr.toString());
        emit(NewssportsGetErrorState(erorr));
      });
    }else
    {
      emit(NewssportsGetSuccessState());
    }
  }
//--------------------------------------------------------------------
  List<dynamic> science = [];
  void Getscience() {
    emit(NewsscienceLoadingState());

    if(science.length == 0)
    {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '90fbed64c13a4a8281c3197b389dd8d5',
        },
      ).then((value) {
        //print(value.data['articles'][0]['author'].toString());
        science = value.data['articles'];
        print(science[0]['title']);

        emit(NewsscienceGetSuccessState());
      }).catchError((erorr) {
        print(erorr.toString());
        emit(NewsscienceGetErrorState(erorr));
      });
    }else
    {
      emit(NewsscienceGetSuccessState());
    }

  }
//--------------------------------------------------------------------
  List<dynamic> Search = [];
  void GetSearch(String value) {
    emit(NewsSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '90fbed64c13a4a8281c3197b389dd8d5',
      },
    ).then((value) {
      //print(value.data['articles'][0]['author'].toString());
      Search = value.data['articles'];
      print(Search[0]['title']);

      emit(NewsSearchGetSuccessState());
    }).catchError((erorr) {
      print(erorr.toString());
      emit(NewsSearchGetErrorState(erorr));
    });

  }


//--------------------------------------------------------------------
  bool isDark=false;
  void ChangeAppMode({bool? fromShared})
  {
    if(fromShared != null)
    {
      isDark = fromShared ;
      emit(changeAppModeState());
    }else
    {
      isDark = !isDark;
      CacheHelper.putBool(key: 'isDark', value: isDark).then((value) {
        emit(changeAppModeState());
      });
    }
  }
}
