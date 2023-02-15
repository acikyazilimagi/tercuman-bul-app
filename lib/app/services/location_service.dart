import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/app/services/firestore_service.dart';
import 'package:location/location.dart';

class LocationService {
  final Location _location = Location();

  StreamSubscription<LocationData>? _locationSub;

  Future<void> init() async {
    try {
      final isServiceEnabled = await _location.serviceEnabled();
      if (!isServiceEnabled) {
        final isServiceEnabled = await _location.requestService();
        if (!isServiceEnabled) {
          return;
        }
      }

      final isPermissionGranted = await _location.hasPermission();
      if (isPermissionGranted == PermissionStatus.denied) {
        final isPermissionGranted = await _location.requestPermission();
        if (isPermissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      _location.changeSettings(
        accuracy: LocationAccuracy.high,
        interval: Duration(minutes: 30).inMilliseconds,
        distanceFilter: 10,
      );

      if (!kIsWeb) {
        _location.enableBackgroundMode(enable: true);
      }

      _locationSub = _location.onLocationChanged.listen((currentLocation) {
        FirestoreService().updateUserLocation(
            GeoPoint(currentLocation.latitude!, currentLocation.longitude!));
      });
    } catch (e) {
      print(e);
    }
  }

  Future<LocationData> getLocation() async {
    return await _location.getLocation();
  }

  Future<void> dispose() async {
    _locationSub?.cancel();
  }
}
