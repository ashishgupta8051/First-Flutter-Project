
import 'dart:convert';

ForecastData forecastDataFromJson(String str) => ForecastData.fromJson(json.decode(str));


class ForecastData {
    ForecastData({
        required this.city,
        required this.cnt,
        required this.cod,
        required this.message,
        required this.list,
    });

    City city;
    int cnt;
    String cod;
    double message;
    List<ListElement> list;

    factory ForecastData.fromJson(Map<dynamic, dynamic> json) => ForecastData(
        city: City.fromJson(json["city"]),
        cnt: json["cnt"],
        cod: json["cod"],
        message: json["message"]?.toDouble(),
        list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    );

}

class City {
    City({
        required this.country,
        required this.coord,
        required this.timezone,
        required this.name,
        required this.id,
        required this.population,
    });

    String country;
    Coord coord;
    int timezone;
    String name;
    int id;
    int population;

    factory City.fromJson(Map<dynamic, dynamic> json) => City(
        country: json["country"],
        coord: Coord.fromJson(json["coord"]),
        timezone: json["timezone"],
        name: json["name"],
        id: json["id"],
        population: json["population"],
    );

}

class Coord {
    Coord({
        required this.lon,
        required this.lat,
    });

    double lon;
    double lat;

    factory Coord.fromJson(Map<dynamic, dynamic> json) => Coord(
        lon: json["lon"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
    );

}

class ListElement {
    ListElement({
        required this.sunrise,
        required this.temp,
        required this.deg,
        required this.pressure,
        required this.clouds,
        required this.feelsLike,
        required this.speed,
        required this.dt,
        required this.pop,
        required this.sunset,
        required this.weather,
        required this.humidity,
        required this.gust,
    });

    int sunrise;
    Temp temp;
    int deg;
    int pressure;
    int clouds;
    FeelsLike feelsLike;
    double speed;
    int dt;
    num pop;
    int sunset;
    List<Weather> weather;
    int humidity;
    double gust;

    factory ListElement.fromJson(Map<dynamic, dynamic> json) => ListElement(
        sunrise: json["sunrise"],
        temp: Temp.fromJson(json["temp"]),
        deg: json["deg"],
        pressure: json["pressure"],
        clouds: json["clouds"],
        feelsLike: FeelsLike.fromJson(json["feels_like"]),
        speed: json["speed"]?.toDouble(),
        dt: json["dt"],
        pop: json["pop"],
        sunset: json["sunset"],
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        humidity: json["humidity"],
        gust: json["gust"]?.toDouble(),
    );

}

class FeelsLike {
    FeelsLike({
        required this.eve,
        required this.night,
        required this.day,
        required this.morn,
    });

    double eve;
    double night;
    double day;
    double morn;

    factory FeelsLike.fromJson(Map<dynamic, dynamic> json) => FeelsLike(
        eve: json["eve"]?.toDouble(),
        night: json["night"]?.toDouble(),
        day: json["day"]?.toDouble(),
        morn: json["morn"]?.toDouble(),
    );

}

class Temp {
    Temp({
        required this.min,
        required this.max,
        required this.eve,
        required this.night,
        required this.day,
        required this.morn,
    });

    double min;
    double max;
    double eve;
    double night;
    double day;
    double morn;

    factory Temp.fromJson(Map<dynamic, dynamic> json) => Temp(
        min: json["min"]?.toDouble(),
        max: json["max"]?.toDouble(),
        eve: json["eve"]?.toDouble(),
        night: json["night"]?.toDouble(),
        day: json["day"]?.toDouble(),
        morn: json["morn"]?.toDouble(),
    );

}

class Weather {
    Weather({
        required this.icon,
        required this.description,
        required this.main,
        required this.id,
    });

    String icon;
    String description;
    String main;
    int id;

    factory Weather.fromJson(Map<dynamic, dynamic> json) => Weather(
        icon: json["icon"],
        description: json["description"],
        main: json["main"],
        id: json["id"],
    );


}
