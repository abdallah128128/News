abstract class NewsStates {}
class initialState extends NewsStates {}
class changeBottomNavState extends NewsStates {}
class changeAppModeState extends NewsStates {}
//--------------------------------------------------------------------
class NewsBusinessLoadingState extends NewsStates {}
class NewsBusinessGetSuccessState extends NewsStates {}
class NewsBusinessGetErrorState extends NewsStates {
  final String erorr;
  NewsBusinessGetErrorState(this.erorr);
}
//--------------------------------------------------------------------
class NewssportsLoadingState extends NewsStates {}
class NewssportsGetSuccessState extends NewsStates {}
class NewssportsGetErrorState extends NewsStates {
  final String erorr;
  NewssportsGetErrorState(this.erorr);
}
//--------------------------------------------------------------------
class NewsscienceLoadingState extends NewsStates {}
class NewsscienceGetSuccessState extends NewsStates {}
class NewsscienceGetErrorState extends NewsStates {
  final String erorr;
  NewsscienceGetErrorState(this.erorr);
}
//--------------------------------------------------------------------
class NewsSearchLoadingState extends NewsStates {}
class NewsSearchGetSuccessState extends NewsStates {}
class NewsSearchGetErrorState extends NewsStates {
  final String erorr;
  NewsSearchGetErrorState(this.erorr);
}