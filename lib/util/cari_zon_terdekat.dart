import 'dart:math' show cos, sqrt, asin;

import '../constant/zon_waktu_solat.dart';
import '../model/koordinat.dart';
import '../model/koordinat_zon_waktu_solat.dart';

ZonWaktuSolat cariZonTerdekat(Koordinat koordinatSemasa) {
  double minDistance = double.infinity;
  // Set an initial nearest zone.
  ZonWaktuSolat nearestZone = ZonWaktuSolat.JHR01;

  for (var state in zonWaktuSolat.data.keys) {
    final zones = zonWaktuSolat.data[state]!.data;

    for (var zone in zones.keys) {
      for (var koordinatZon in zones[zone]!) {
        final distance = _calculateDistance(
          koordinatSemasa.latitud,
          koordinatSemasa.longitud,
          koordinatZon.latitud,
          koordinatZon.longitud,
        );

        if (distance < minDistance) {
          minDistance = distance;
          nearestZone = zone;
        }
      }
    }
  }

  return nearestZone;
}

double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  const p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;

  return 12742 * asin(sqrt(a));
}
