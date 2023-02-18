import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/app/services/firestore_service.dart';
import 'package:location/location.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;
  LocationService._internal() {
    _init();
  }

  final Location _location = Location();
  StreamSubscription<LocationData>? _locationSub;

  Future<void> _init() async {
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
        interval: const Duration(minutes: 30).inMilliseconds,
        distanceFilter: 10,
      );

      if (!kIsWeb) {
        _location.enableBackgroundMode(enable: true);

        _locationSub = _location.onLocationChanged.listen((l) {
          FirestoreService()
              .updateLocation(GeoPoint(l.latitude!, l.longitude!));
        });
      } else {
        await updateLocation();
      }
    } catch (e) {
      log("Location service exception:", error: e);
    }
  }

  Future<void> updateLocation() async {
    await FirestoreService().updateLocation(await getLocation());
  }

  Future<GeoPoint> getLocation() async {
    var l = await Location().getLocation();
    return GeoPoint(l.latitude!, l.longitude!);
  }

  Future<void> dispose() async {
    _locationSub?.cancel();
  }
}
