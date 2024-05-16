import 'package:random_string/random_string.dart';

String getCurrentDate(){
  String id = randomAlphaNumeric(10);
  DateTime now = DateTime.now();
  String date =
      "${now.toString().substring(8, 10)} ${now.toString().substring(5, 7)} ${now.toString().substring(0, 4)}";
  return date;
}