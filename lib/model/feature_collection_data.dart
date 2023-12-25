
import 'dart:convert';

QuakeData featureCollectionDataFromJson(String str) => QuakeData.fromJson(json.decode(str));

String featureCollectionDataToJson(QuakeData data) => json.encode(data.toJson());

class QuakeData {
    QuakeData({
        required this.features,
        required this.metadata,
        required this.bbox,
        required this.type,
    });

    List<Feature> features;
    Metadata metadata;
    List<double> bbox;
    String type;

    factory QuakeData.fromJson(Map<dynamic, dynamic> json) => QuakeData(
        features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
        metadata: Metadata.fromJson(json["metadata"]),
        bbox: List<double>.from(json["bbox"].map((x) => x?.toDouble())),
        type: json["type"],
    );

    Map<dynamic, dynamic> toJson() => {
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "metadata": metadata.toJson(),
        "bbox": List<dynamic>.from(bbox.map((x) => x)),
        "type": type,
    };
}

class Feature {
    Feature({
        required this.geometry,
        required this.id,
        required this.type,
        required this.properties,
    });

    Geometry geometry;
    String id;
    FeatureType type;
    Properties properties;

    factory Feature.fromJson(Map<dynamic, dynamic> json) => Feature(
        geometry: Geometry.fromJson(json["geometry"]),
        id: json["id"],
        type: featureTypeValues.map[json["type"]]!,
        properties: Properties.fromJson(json["properties"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "geometry": geometry.toJson(),
        "id": id,
        "type": featureTypeValues.reverse[type],
        "properties": properties.toJson(),
    };
}

class Geometry {
    Geometry({
        required this.coordinates,
        required this.type,
    });

    List<double> coordinates;
    GeometryType type;

    factory Geometry.fromJson(Map<dynamic, dynamic> json) => Geometry(
        coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
        type: geometryTypeValues.map[json["type"]]!,
    );

    Map<dynamic, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "type": geometryTypeValues.reverse[type],
    };
}

enum GeometryType { POINT }

final geometryTypeValues = EnumValues({
    "Point": GeometryType.POINT
});

class Properties {
    Properties({
        this.dmin,
        required this.code,
        required this.sources,
        required this.type,
        required this.title,
        required this.magType,
        this.nst,
        required this.sig,
        required this.tsunami,
        required this.mag,
        this.gap,
        required this.rms,
        required this.place,
        required this.net,
        required this.types,
        required this.url,
        required this.ids,
        required this.time,
        required this.detail,
        required this.updated,
        required this.status,
        this.felt,
        this.cdi,
        this.mmi,
        this.alert,
    });

    double? dmin;
    String code;
    String sources;
    PropertiesType type;
    String title;
    MagType magType;
    int? nst;
    int sig;
    int tsunami;
    double mag;
    int? gap;
    double rms;
    String place;
    String net;
    String types;
    String url;
    String ids;
    int time;
    String detail;
    int updated;
    Status status;
    int? felt;
    double? cdi;
    double? mmi;
    String? alert;

    factory Properties.fromJson(Map<dynamic, dynamic> json) => Properties(
        dmin: json["dmin"]?.toDouble(),
        code: json["code"],
        sources: json["sources"],
        type: propertiesTypeValues.map[json["type"]]!,
        title: json["title"],
        magType: magTypeValues.map[json["magType"]]!,
        nst: json["nst"],
        sig: json["sig"],
        tsunami: json["tsunami"],
        mag: json["mag"]?.toDouble(),
        gap: json["gap"],
        rms: json["rms"]?.toDouble(),
        place: json["place"],
        net: json["net"],
        types: json["types"],
        url: json["url"],
        ids: json["ids"],
        time: json["time"],
        detail: json["detail"],
        updated: json["updated"],
        status: statusValues.map[json["status"]]!,
        felt: json["felt"],
        cdi: json["cdi"]?.toDouble(),
        mmi: json["mmi"]?.toDouble(),
        alert: json["alert"],
    );

    Map<dynamic, dynamic> toJson() => {
        "dmin": dmin,
        "code": code,
        "sources": sources,
        "type": propertiesTypeValues.reverse[type],
        "title": title,
        "magType": magTypeValues.reverse[magType],
        "nst": nst,
        "sig": sig,
        "tsunami": tsunami,
        "mag": mag,
        "gap": gap,
        "rms": rms,
        "place": place,
        "net": net,
        "types": types,
        "url": url,
        "ids": ids,
        "time": time,
        "detail": detail,
        "updated": updated,
        "status": statusValues.reverse[status],
        "felt": felt,
        "cdi": cdi,
        "mmi": mmi,
        "alert": alert,
    };
}

enum MagType { MB, ML, MD, MWW }

final magTypeValues = EnumValues({
    "mb": MagType.MB,
    "md": MagType.MD,
    "ml": MagType.ML,
    "mww": MagType.MWW
});

enum Status { REVIEWED, AUTOMATIC }

final statusValues = EnumValues({
    "automatic": Status.AUTOMATIC,
    "reviewed": Status.REVIEWED
});

enum PropertiesType { EARTHQUAKE }

final propertiesTypeValues = EnumValues({
    "earthquake": PropertiesType.EARTHQUAKE
});

enum FeatureType { FEATURE }

final featureTypeValues = EnumValues({
    "Feature": FeatureType.FEATURE
});

class Metadata {
    Metadata({
        required this.generated,
        required this.count,
        required this.api,
        required this.title,
        required this.url,
        required this.status,
    });

    int generated;
    int count;
    String api;
    String title;
    String url;
    int status;

    factory Metadata.fromJson(Map<dynamic, dynamic> json) => Metadata(
        generated: json["generated"],
        count: json["count"],
        api: json["api"],
        title: json["title"],
        url: json["url"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "generated": generated,
        "count": count,
        "api": api,
        "title": title,
        "url": url,
        "status": status,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
