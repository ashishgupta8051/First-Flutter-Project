/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

class UserData {
    UserData({
        required this.website,
        required this.address,
        required this.phone,
        required this.name,
        required this.company,
        required this.id,
        required this.email,
        required this.username,
    });

    String website;
    Address address;
    String phone;
    String name;
    Company company;
    int id;
    String email;
    String username;

    factory UserData.fromJson(Map<dynamic, dynamic> json) => UserData(
        website: json["website"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        name: json["name"],
        company: Company.fromJson(json["company"]),
        id: json["id"],
        email: json["email"],
        username: json["username"],
    );
}

class Address {
    Address({
        required this.zipcode,
        required this.geo,
        required this.suite,
        required this.city,
        required this.street,
    });

    String zipcode;
    Geo geo;
    String suite;
    String city;
    String street;

    factory Address.fromJson(Map<dynamic, dynamic> json) => Address(
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
        suite: json["suite"],
        city: json["city"],
        street: json["street"],
    );
}

class Geo {
    Geo({
        required this.lng,
        required this.lat,
    });

    String lng;
    String lat;

    factory Geo.fromJson(Map<dynamic, dynamic> json) => Geo(
        lng: json["lng"],
        lat: json["lat"],
    );

}

class Company {
    Company({
        required this.bs,
        required this.catchPhrase,
        required this.name,
    });

    String bs;
    String catchPhrase;
    String name;

    factory Company.fromJson(Map<dynamic, dynamic> json) => Company(
        bs: json["bs"],
        catchPhrase: json["catchPhrase"],
        name: json["name"],
    );
}
