import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'homepage.g.dart';

class HomePageConstants{
  final txtGoodMorning = "Good morning";
  final txtToDoList = "ToDo List";
  final txtDailyTasks = "Daily tasks";

}
@riverpod
HomePageConstants homePageConstants(HomePageConstantsRef ref){
  return HomePageConstants();
}
