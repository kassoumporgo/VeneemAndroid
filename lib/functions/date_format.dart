import '../constants/texts.dart';



String dateFormat({required String date}) {
  return dayOfWeek[DateTime.parse(date).weekday]!+" "+
      DateTime.parse(date).day.toString()+" "+
      monthOfYear[DateTime.parse(date).month]!+" "+
      DateTime.parse(date).year.toString()+' à '+
      DateTime.parse(date).hour.toString()+":"+
      DateTime.parse(date).minute.toString();
}