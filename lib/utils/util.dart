
import 'package:intl/intl.dart';

class Util{
  static getDateTimeFormat(int timeZone){
    // DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeZone * 1000, isUtc: false);
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeZone * 1000);
    String formattedDate = DateFormat('EEEE, MMM d, y').format(dateTime);
    return formattedDate;
  }
}
