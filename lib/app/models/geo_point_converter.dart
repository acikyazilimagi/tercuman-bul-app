import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class GeoPointConverter implements JsonConverter<GeoPoint, GeoPoint> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(GeoPoint geoPoint) {
    return geoPoint;
  }

  @override
  GeoPoint toJson(GeoPoint geoPoint) => geoPoint;
}
