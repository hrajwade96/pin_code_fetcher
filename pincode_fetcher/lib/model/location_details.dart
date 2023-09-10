class LocationData {
  List<Results>? results;

  LocationData({this.results});

  LocationData.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultsData {
  String? objectId;
  GeoPosition? geoPosition;
  String? countryCode;
  String? postalCode;
  String? placeName;
  String? adminName1;
  String? adminCode1;
  String? adminName2;
  String? adminCode2;
  String? adminName3;
  String? adminCode3;
  String? accuracy;
  String? createdAt;
  String? updatedAt;

  ResultsData(
      {this.objectId,
      this.geoPosition,
      this.countryCode,
      this.postalCode,
      this.placeName,
      this.adminName1,
      this.adminCode1,
      this.adminName2,
      this.adminCode2,
      this.adminName3,
      this.adminCode3,
      this.accuracy,
      this.createdAt,
      this.updatedAt});

  ResultsData.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    geoPosition = json['geoPosition'] != null
        ? GeoPosition.fromJson(json['geoPosition'])
        : null;
    countryCode = json['countryCode'];
    postalCode = json['postalCode'];
    placeName = json['placeName'];
    adminName1 = json['adminName1'];
    adminCode1 = json['adminCode1'];
    adminName2 = json['adminName2'];
    adminCode2 = json['adminCode2'];
    adminName3 = json['adminName3'];
    adminCode3 = json['adminCode3'];
    accuracy = json['accuracy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    if (geoPosition != null) {
      data['geoPosition'] = geoPosition!.toJson();
    }
    data['countryCode'] = countryCode;
    data['postalCode'] = postalCode;
    data['placeName'] = placeName;
    data['adminName1'] = adminName1;
    data['adminCode1'] = adminCode1;
    data['adminName2'] = adminName2;
    data['adminCode2'] = adminCode2;
    data['adminName3'] = adminName3;
    data['adminCode3'] = adminCode3;
    data['accuracy'] = accuracy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class GeoPosition {
  String? sType;
  double? latitude;
  double? longitude;

  GeoPosition({this.sType, this.latitude, this.longitude});

  GeoPosition.fromJson(Map<String, dynamic> json) {
    sType = json['__type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__type'] = sType;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class LocationDetails {
  List<Results>? results;

  LocationDetails({this.results});

  LocationDetails.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? objectId;
  GeoPosition? geoPosition;
  String? countryCode;
  String? postalCode;
  String? placeName;
  String? adminName1;
  String? adminCode1;
  String? adminName2;
  String? adminCode2;
  String? adminName3;
  String? adminCode3;
  String? accuracy;
  String? createdAt;
  String? updatedAt;

  Results(
      {this.objectId,
      this.geoPosition,
      this.countryCode,
      this.postalCode,
      this.placeName,
      this.adminName1,
      this.adminCode1,
      this.adminName2,
      this.adminCode2,
      this.adminName3,
      this.adminCode3,
      this.accuracy,
      this.createdAt,
      this.updatedAt});

  Results.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    geoPosition = json['geoPosition'] != null
        ? GeoPosition.fromJson(json['geoPosition'])
        : null;
    countryCode = json['countryCode'];
    postalCode = json['postalCode'];
    placeName = json['placeName'];
    adminName1 = json['adminName1'];
    adminCode1 = json['adminCode1'];
    adminName2 = json['adminName2'];
    adminCode2 = json['adminCode2'];
    adminName3 = json['adminName3'];
    adminCode3 = json['adminCode3'];
    accuracy = json['accuracy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    if (geoPosition != null) {
      data['geoPosition'] = geoPosition!.toJson();
    }
    data['countryCode'] = countryCode;
    data['postalCode'] = postalCode;
    data['placeName'] = placeName;
    data['adminName1'] = adminName1;
    data['adminCode1'] = adminCode1;
    data['adminName2'] = adminName2;
    data['adminCode2'] = adminCode2;
    data['adminName3'] = adminName3;
    data['adminCode3'] = adminCode3;
    data['accuracy'] = accuracy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class GeoPositionDetails {
  String? sType;
  double? latitude;
  double? longitude;

  GeoPositionDetails({this.sType, this.latitude, this.longitude});

  GeoPositionDetails.fromJson(Map<String, dynamic> json) {
    sType = json['__type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__type'] = sType;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
