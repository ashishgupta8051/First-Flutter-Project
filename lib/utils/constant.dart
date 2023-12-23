class Constant{
  static String baseUrl = "https://jsonplaceholder.typicode.com/";
  static int successful = 200;

  static getForecastBaseUrl(String query){
    return "https://api.openweathermap.org/data/2.5/forecast/daily?q=$query&appid=ed60fcfbd110ee65c7150605ea8aceea";
  }
}