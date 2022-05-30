//
//https:newsapi.org/v2/everything?q=tesla&from=2021-12-31&sortBy=publishedAt&apiKey=API_KEY


import 'cache_helper.dart';
import 'componants.dart';

dynamic token = '';
String? uId ;

// void SignOut(context) {
//   CacheHelper.RemoveData(
//     key: 'token',
//   ).then((value) {
//     if (value) {
//       NavigateAndFinish(context, ShopLoginScreen());
//       token = null;
//     }
//   });
// }

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
