
class TypeHelper {

  static int toInt(num? value){
    try{
      if(value == null){
        return 0;
      }else if(value is int){
        return value;
      }else{
        return value.toInt();
      }
    }catch(e){
      print(e);
      return 0;
    }
  }

  static double toDouble(num? value){
    try{
      if(value == null){
        return 0.0;
      }else if(value is double){
        return value;
      }else{
        return value.toDouble();
      }
    }catch(e){
      print(e);
      return 0.0;
    }
  }
}